import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
import java.util.*;

public class SearchAndBrowse {
    //Scenario 3: sub options

    public void nominees(Connection conn) throws SQLException, IOException {
        //Scenario 3: Option A (The nominees from each team)
        Statement stmt = conn.createStatement();
        String query1 = "select player_name, score ,position from Allstar_team_nominees order by score DESC;";
        ResultSet rset;
        PreparedStatement p1 = conn.prepareStatement (query1);
        System.out.println("The nominees from each team, categorized by position");
        System.out.println("--------------------------------------------------\n");
        rset = p1.executeQuery();

        List<String> player_info = new ArrayList<>();
        List<String> position = new ArrayList<>();
        Map<String,List<String>> resultMap = new HashMap<String,List<String>>();

        while (rset.next()) {
            player_info.add("Score:"+rset.getString(2)+"  Name:"+rset.getString(1)+" ");
            position.add(rset.getString(3));
        }

        //7 positions: quarterback, running, backs, inside receivers, wide receivers, center players, guards, and tackles.
        List<String> quarterback = new ArrayList<>();
        List<String> running = new ArrayList<>();
        List<String> backs = new ArrayList<>();
        List<String> inside_receiver = new ArrayList<>();
        List<String> wide_receiver = new ArrayList<>();
        List<String> center_players = new ArrayList<>();
        List<String> guards = new ArrayList<>();
        List<String> tackles = new ArrayList<>();

        //resort by position
        for (int i=0; i<position.size(); i++) {
            if (position.get(i).equals("quarterback")){
                quarterback.add(player_info.get(i));
                resultMap.put(position.get(i), quarterback);
            } else if (position.get(i).equals("running back")){
                running.add(player_info.get(i));
                resultMap.put(position.get(i), running);
            } else if (position.get(i).equals("backs")){
                backs.add(player_info.get(i));
                resultMap.put(position.get(i), backs);
            } else if (position.get(i).equals("inside receiver")){
                inside_receiver.add(player_info.get(i));
                resultMap.put(position.get(i), inside_receiver);
            } else if (position.get(i).equals("wide receiver")){
                wide_receiver.add(player_info.get(i));
                resultMap.put(position.get(i), wide_receiver);
            } else if (position.get(i).equals("center player")){
                center_players.add(player_info.get(i));
                resultMap.put(position.get(i), center_players);
            } else if (position.get(i).equals("guard")){
                guards.add(player_info.get(i));
                resultMap.put(position.get(i), guards);
            } else if (position.get(i).equals("tackle")) {
                tackles.add(player_info.get(i));
                resultMap.put(position.get(i), tackles);
            }else {
                System.out.println("position not found");
            }
        }
        //print results
        for (Map.Entry<String,List<String>> entry : resultMap.entrySet()){
                System.out.println(entry.getKey());
                for (String subvalue : entry.getValue()){
                    System.out.println("\t"+subvalue);
                }
        }
    }


    public void search(Connection conn) throws SQLException {
        //Contains switch statement and selection for search sub options
        System.out.print("Type in your option: ");
        System.out.flush();
        String ch = ProjectTask4.readLine();
        System.out.println();
        switch (ch.charAt(0)) {
            case 'A':
                teamInfo(conn);
                break;
            case 'B':
                gameInfo(conn);
                break;
            case 'C':
                coachInfo(conn);
                break;
            default:
                System.out.println(" Not a valid option ");
        } //switch
    }

    public void teamInfo(Connection conn) throws SQLException {
        //This option prompts the user for the name of a team and
        //presents the name of its players, the name of its coach, and the rank of the team
        System.out.println("Please enter a team name:");
        String teamName = ProjectTask4.readLine();

        String query = "SELECT player_name, coach_name, ranking FROM Players right join Championship_teams on Players.uni_name = Championship_teams.uni_name " +
                "where Players.uni_name = (select uni_name from Championship_teams where team_name = \'" + teamName + "\');";
        Statement stmt = conn.createStatement();
        ResultSet rset = stmt.executeQuery(query);

        rset.next();
        System.out.println("The coach of the " + teamName + " is " + rset.getString(2));
        System.out.println("This teams current ranking is " + rset.getString(3));
        System.out.println("Here is a list of the players:");
        while(rset.next()){
            System.out.println(rset.getString(1));
        }
    }

    public void gameInfo(Connection conn) throws SQLException {
        //This option prompts for the name of a team and provides
        //a list of the games this team played and the corresponding results
        System.out.println("Please enter a team name:");
        String teamName = ProjectTask4.readLine();

        String query ="select game_date, place, score  from Allstar_game where winning_team = \'" + teamName + "\';";

        Statement stmt = conn.createStatement();
        ResultSet rset = stmt.executeQuery(query);
        while(rset.next()){
            System.out.println("On " + rset.getString(1) + " The " + teamName + " played at "
                    + rset.getString(2) + " and won with a score of " + rset.getString(3));
        }
    }

    public void coachInfo(Connection conn) throws SQLException {
        //This option prompts for the name of a coach and
        //provides the name of the team they coach
        System.out.println("Please enter a coach name:");
        String coachName = ProjectTask4.readLine();

        String query ="select team_name from Championship_teams where coach_name = \'" + coachName + "\';";

        Statement stmt = conn.createStatement();
        ResultSet result = stmt.executeQuery(query);
        result.next();
        System.out.print("They are a coach for the " + result.getString(1));
    }
}
