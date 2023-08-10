import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
import java.util.*;

public class Updates {
    //Scenario 1 sub options
    public void updateInfo(Connection conn) {
        // Update current information which includes 3 new sub option
        // implementation not needed for this project
        System.out.println("Sorry! That function has not been implemented yet. Coming soon!");
    }

    public void deleteInfo(Connection conn) throws SQLException {
        //Delete some information which includes 3 new sub options
        System.out.println("delete a player, coach, or team?");
        System.out.print("Type in your option: ");
        System.out.flush();
        String ch = ProjectTask4.readLine();
        System.out.println();
        String query = "";
        switch (ch) {
            case "player":
                //Delete a specific player
                System.out.println("Please enter the ssn of the player:");
                String pssn = ProjectTask4.readLine();
                query = "delete from Players where ssn = \'" + pssn + "\';";
                break;
            case "coach":
                //Delete a specific coach
                System.out.println("Please enter the ssn of the coach:");
                String cssn = ProjectTask4.readLine();
                query = "delete from Coach where ssn = \'" + cssn + "\';";
                break;
            case "team":
                //Delete a specific team
                System.out.println("Please enter the ID number of the team:");
                String id = ProjectTask4.readLine();
                query = "delete from Championship_teams where id_no = \'" + id + "\';";
                break;
            default:
                System.out.println(" Not a valid option ");
        } //switch

        Statement stmt = conn.createStatement();
        stmt.executeUpdate(query);

    }

    public void insertInfo(Connection conn) throws SQLException{
        //Insert new information which includes 3 new sub options
        System.out.println("add new player, coach, or team?");
        System.out.print("Type in your option: ");
        System.out.flush();
        String ch = ProjectTask4.readLine();
        System.out.println();
        String query = "";
        switch (ch) {
            case "player":
                //Add a new player
                System.out.println("Please add player's ssn:");
                String ssn = ProjectTask4.readLine();
                System.out.println("Please add player's name:");
                String name = ProjectTask4.readLine();
                System.out.println("Please add player's address:");
                String address = ProjectTask4.readLine();
                System.out.println("Please add player's birthday:");
                String birth_date = ProjectTask4.readLine();
                System.out.println("Please add player's university:");
                String university = ProjectTask4.readLine();
                System.out.println("Please add player's team years:");
                String teamYears = ProjectTask4.readLine();
                System.out.println("Please add player's university years:");
                String uniYears = ProjectTask4.readLine();
                System.out.println("Please add player's times as an all_star:");
                String timesStar = ProjectTask4.readLine();

                query = "insert into Players values (" + ssn + ", \'" + name + "\', \'" + address + "\', \'" + birth_date + "\', \'" +
                        university + "\', " + teamYears + ", " + uniYears + ", " + timesStar + ");";
                break;
            case "coach":
                //Add a new coach
                System.out.println("Please add coach's ssn:");
                String cssn = ProjectTask4.readLine();
                System.out.println("Please add coach's name:");
                String cname = ProjectTask4.readLine();
                System.out.println("Please add coach's address:");
                String caddress = ProjectTask4.readLine();
                System.out.println("Please add coach's birthday:");
                String cbirth_date = ProjectTask4.readLine();
                System.out.println("Please add coach's university:");
                String cuniversity = ProjectTask4.readLine();
                System.out.println("Please add coach's university years:");
                String cuniYears = ProjectTask4.readLine();
                System.out.println("Please add coaching years:");
                String coachYears = ProjectTask4.readLine();
                System.out.println("Please add coach's championships:");
                String ctimesChamp = ProjectTask4.readLine();
                System.out.println("Please add coach's times at semifinals");
                String ctimesSemi = ProjectTask4.readLine();

                query = "insert into Coach values (" + cssn + ", \'" + cname + "\', \'" + caddress + "\', \'" + cbirth_date + "\', \'" +
                        cuniversity + "\', " + cuniYears + ", " + coachYears + ", " + ctimesChamp + ", " + ctimesSemi + ");";
                break;
            case "team":
                //Add a new team
                System.out.println("Please enter team's id number:");
                String id = ProjectTask4.readLine();
                System.out.println("Please enter team's name:");
                String tname = ProjectTask4.readLine();
                System.out.println("Please enter team's coach name:");
                String tcname = ProjectTask4.readLine();
                System.out.println("Please enter team's university:");
                String tuniversity = ProjectTask4.readLine();
                System.out.println("Please enter team's rank:");
                String rank = ProjectTask4.readLine();
                System.out.println("Please enter team's wins:");
                String wins = ProjectTask4.readLine();
                System.out.println("Please enter team's losses:");
                String losses = ProjectTask4.readLine();
                System.out.println("Please enter team's coach ssn:");
                System.out.println("(Must be an existing coach ssn in the database!");
                String tcssn = ProjectTask4.readLine();
                System.out.println("Please enter team's assistant coach ssn:");
                System.out.println("(Must be an existing assistant coach ssn in the database!");
                String acssn = ProjectTask4.readLine();

                query = "insert into Championship_teams values (" + id + ", \'" + tname + "\', \'" + tcname + "\', + \'" +
                        tuniversity + "\', " + rank + ", " + wins + ", " + losses + ", " + tcssn + ", " + acssn + ");";

                break;
            default:
                System.out.println(" Not a valid option ");
        } //switch
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(query);
    }
}
