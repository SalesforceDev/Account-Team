public class AccountTeamController
{
    private String accId;
    
    public AccountTeamController(ApexPages.StandardController std)
    {
        accId = std.getId();
        initAccountTeam();
    }
    
    public List<AccountTeamMember> AccountTeamMembers {get; set;}
    
    private void initAccountTeam()
    {
        AccountTeamMembers = [select Id, UserId, AccountAccessLevel, OpportunityAccessLevel, CaseAccessLevel, TeamMemberRole from AccountTeamMember where AccountId = :accId];
    }
    
    public String AccountTeamMemberId {get; set;}
    
    public PageReference editAccountTeamMember()
    {
        PageReference pageRef = Page.EditAccountTeamMember;
        pageRef.getParameters().put('id', AccountTeamMemberId);
        return pageRef;
    }
    
    public PageReference addAccountTeamMembers()
    {
        PageReference pageRef = Page.AddAccountTeamMember;
        pageRef.getParameters().put('id', accId);
        return pageRef;
    }

    public void delAccountTeamMember()
    {
        delete [select Id from AccountTeamMember where Id = :AccountTeamMemberId];
        initAccountTeam();
    }
    
    public void deleteAll()
    {
        delete [select Id from AccountTeamMember where AccountId = :accId];
        initAccountTeam();
    }
}