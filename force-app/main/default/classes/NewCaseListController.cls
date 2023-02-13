public class NewCaseListController {
    public List<Case> getNewCases() {
        List<Case> newCases = Database.query('SELECT Id, CaseNumber FROM Case WHERE Status=\'New\'');
        return newCases;
    }
}