import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
import java.util.*;

public class Statistics_Mining extends Allstar{

    //option 1 Scenario 2
    public void score(Connection conn) throws SQLException, IOException {
        Statement stmt = conn.createStatement();
        String query1 = "select player_name, score from Allstar_team_nominees";
        ResultSet rset;
        PreparedStatement p1 = conn.prepareStatement (query1);
        System.out.println("   Score ");
        System.out.println("--------------------------------------------------\n");
        rset = p1.executeQuery();

        List<String> player_name = new ArrayList<>();
        List<String> score = new ArrayList<>();

        while (rset.next()) {
            player_name.add(rset.getString(1));
            score.add(rset.getString(2));
        }
        System.out.println("The score each nominee received in the evaluation process");
        for (int i=0; i<player_name.size(); i++) {
            System.out.println(player_name.get(i) + ", " + score.get(i));
        }
    }

    //option 2 Scenario 2
    public void winsPerTeam(Connection conn) throws SQLException, IOException {
        Statement stmt = conn.createStatement();
        String query1 = "select game_date, winning_team from Allstar_game";
        ResultSet rset;
        PreparedStatement p1 = conn.prepareStatement (query1);
        System.out.println("   Wins per team ");
        System.out.println("--------------------------------------------------\n");
        rset = p1.executeQuery();

        List<String> game_date = new ArrayList<>();
        List<String> winning_team = new ArrayList<>();

        while (rset.next()) {
            game_date.add(rset.getString(1));
            winning_team.add(rset.getString(2));
        }
        System.out.println("Total number of wins in a championship during the last five years");
        for (int i=0; i<winning_team.size(); i++) {
            String year=game_date.get(i).substring(0,4);
            int yearNum=Integer.parseInt(year);
            if (yearNum>2015) {
                System.out.println(winning_team.get(i) + ", " + game_date.get(i));
            }
        }
    }

    //option 3 Scenario 2
    public void championshipPart(Connection conn) throws SQLException, IOException {
        Statement stmt = conn.createStatement();
        String query1 = "select game_date, id_no from Allstar_game_has_Championship_teams";
        String query2 = "select id_no, team_name from Championship_teams";
        ResultSet rset1;
        ResultSet rset2;
        PreparedStatement p1 = conn.prepareStatement (query1);
        PreparedStatement p2 = conn.prepareStatement (query2);
        System.out.println("   Championship participation ");
        System.out.println("--------------------------------------------------\n");
        rset1 = p1.executeQuery();
        rset2 = p2.executeQuery();

        List<String> game_date = new ArrayList<>();
        List<String> id_no_All = new ArrayList<>();
        List<String> id_no_Ch = new ArrayList<>();
        List<String> team_name = new ArrayList<>();

        while (rset1.next()) {
            game_date.add(rset1.getString(1));
            id_no_All.add(rset1.getString(2));
        }
        while (rset2.next()) {
            id_no_Ch.add(rset2.getString(1));
            team_name.add(rset2.getString(2));
        }

        System.out.println("Total participated teams in the championship during the last 5 years");
        for (int i=0; i<id_no_All.size(); i++) {
            String year=game_date.get(i).substring(0,4); //extract first 4 characters of game_date string
            int yearNum=Integer.parseInt(year);  //convert year to integer
            for (int j=0; j<id_no_Ch.size(); j++){  //loop thru id_no
                if (id_no_Ch.get(j).equals(id_no_All.get(i)) && yearNum>2015) { //if id_no match and year>2015
                    System.out.println(team_name.get(j) + ", " + game_date.get(i));
                }
            }
        }
    }

}
