// Team 6
// Bernard Mulcahy, Amrit Pandher
// CS331, Nov 19 2020
// Project task 4

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
import java.util.*;

    public class ProjectTask4{

        public static void main(String args[]) {
            Connection conn = null;
            try {
                //Step 1: Load the JDBC driver(You have to have the connector Jar file in your project Class path)
                Class.forName("com.mysql.cj.jdbc.Driver");
                //Connect to the database(Change the URL)
                String url = "jdbc:mysql://localhost:3306/Allstar_Team?serverTimezone=UTC&useSSL=TRUE";
                String user, pass;
                user = readEntry("userid : ");
                pass = readEntry("password: ");
                conn = DriverManager.getConnection(url, user, pass);
                Allstar Allstar1 = new Allstar();
                boolean done = false;
                do {
                    Allstar1.printMenuMain();
                    System.out.print("Type in your option: ");
                    System.out.flush();
                    String ch = readLine();
                    System.out.println();
                    switch (ch.charAt(0)) {
                        case '1': searchAndBrowse(conn);
                            break;
                        case '2': statAndDataMenu(conn);
                            break;
                        case '3': update(conn);
                            break;
                        case '4': done = true;
                            break;
                        default:
                            System.out.println(" Not a valid option ");
                    } //switch
                } while (!done);

            } catch (ClassNotFoundException e) {
                System.out.println("Could not load the driver");
            } catch (SQLException ex) {
                System.out.println(ex);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {   
                        System.out.println(e);
                    }
                }
            }
        }


        private static void searchAndBrowse(Connection conn) throws SQLException, IOException {
            //Implementation of Scenario 3
            Allstar scenarioThree = new Allstar();
            scenarioThree.menuThree();
            SearchAndBrowse SnB = new SearchAndBrowse();
            System.out.print("Type in your option: ");
            System.out.flush();
            String ch = readLine();
            System.out.println();
            switch (ch.charAt(0)) {
                case 'A':
                    SnB.nominees(conn);
                    break;
                case 'B':
                    scenarioThree.subMenuThree();
                    SnB.search(conn);
                    break;
                case 'C':
                    System.out.println("Returning to main interface...");;
                    break;
                default:
                    System.out.println(" Not a valid option ");
            } //switch
        }


        private static void statAndDataMenu(Connection conn) throws SQLException, IOException {
            //Implementation of Scenario 2
            Statistics_Mining menu2 = new Statistics_Mining();
            boolean done = false;
            while (!done) {
                menu2.printMenu2();
                System.out.print("Type in your option: ");
                System.out.flush();
                String ch = readLine();
                System.out.println();
                switch (ch.charAt(0)) {
                    //1. When the user chooses option 1 (Score) from the interface in Figure 2, it should list the score that
                    //each nominee received in the evaluation process
                    case '1': menu2.score(conn);
                        break;
                    //2. When the user chooses option 2 (Wins per team) from the interface in Figure 2, it should for
                    //each team, list the total number of wins in a championship during the last five years
                    case '2': menu2.winsPerTeam(conn);
                        break;
                    //3. When the user chooses option 3 (Championship participation) from the interface in Figure 2, it
                    //should list the number of participating teams in the championship during the last 5 years.
                    case '3': menu2.championshipPart(conn);
                        break;
                    //4. When the user choose option 4 (Quit): It should return the application to the main interface in figure 1
                    case '4': done = true;
                        break;
                    default:
                        System.out.println(" Not a valid option ");
                }
            }
        }

        //Scenario 1
        private static void update(Connection conn) throws SQLException, IOException {
            //Implementation of Scenario 1
            Allstar scenarioOne = new Allstar();
            scenarioOne.menuOne();
            Updates update1 = new Updates();
            System.out.print("Type in your option: ");
            System.out.flush();
            String ch = readLine();
            System.out.println();
            switch (ch.charAt(0)) {
                case 'A':
                    update1.insertInfo(conn);
                    break;
                case 'B':
                    update1.deleteInfo(conn);
                    break;
                case 'C':
                    update1.updateInfo(conn);
                    break;
                default:
                    System.out.println(" Not a valid option ");
            } //switch
        }

        public static String readEntry(String prompt) {
            try {
                StringBuffer buffer = new StringBuffer();
                System.out.print(prompt);
                System.out.flush();
                int c = System.in.read();
                while(c != '\n' && c != -1) {
                    buffer.append((char)c);
                    c = System.in.read();
                }
                return buffer.toString().trim();
            } catch (IOException e) {
                return "";
            }
        }

        public static String readLine() {
            InputStreamReader isr = new InputStreamReader(System.in);
            BufferedReader br = new BufferedReader(isr, 1);
            String line = "";

            try {
                line = br.readLine();
            } catch (IOException e) {
                System.out.println("Error in SimpleIO.readLine: " +
                        "IOException was thrown");
                System.exit(1);
            }
            return line;
        }
    }

