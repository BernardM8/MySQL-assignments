public class Allstar {

    public static void printMenuMain() {
        //Main menu print
        System.out.println("\n *****************************************************************************");
        System.out.println("                               ***********                                   ");
        System.out.println("                  Welcome to Selecting an All-Star Team                      ");
        System.out.println("                               Main Menu                                   ");
        System.out.println("*****************************************************************************");
        System.out.println("                    1. Search & Browse the Database                      ");
        System.out.println("                      2. Statistics & Data Mining                      ");
        System.out.println("                              3. Updates                      ");
        System.out.println("                               4. Quit                     ");
        System.out.println("\n");
    }

    public void menuOne() {
        //Scenario one menu print
        System.out.println("\n**************************************************************");
        System.out.println("                     Please select an option                   ");
        System.out.println("****************************************************************");
        System.out.println("                     A. Insert new information");
        System.out.println("                     B. Delete some information");
        System.out.println("                     C. Update current information");
    }

    public void printMenu2() {
        System.out.println("\n *****************************************************************************");
        System.out.println("                               ***********                                   ");
        System.out.println("                       2. Statistics & Data Mining                      ");
        System.out.println("                                  Menu                                    ");
        System.out.println("*****************************************************************************");
        System.out.println("                               1. Score                      ");
        System.out.println("                           2. Wins per team                      ");
        System.out.println("                    3. Championship participation                      ");
        System.out.println("                                4. Quit                     ");
        System.out.println("\n");
    }

    public void menuThree() {
        //Scenario three menu print
        System.out.println("\n**************************************************************");
        System.out.println("                     Please select an option                   ");
        System.out.println("****************************************************************");
        System.out.println("                     A. The nominees from each team");
        System.out.println("                     B. Search");
        System.out.println("                     C. Quit");
    }

    public void subMenuThree() {
        //Scenario three sub menu print
        System.out.println("\n**************************************************************");
        System.out.println("                     Please select a sub option                   ");
        System.out.println("****************************************************************");
        System.out.println("                     A. Team info");
        System.out.println("                     B. Game info");
        System.out.println("                     C. Coach info");
    }
}
