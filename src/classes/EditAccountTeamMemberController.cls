public with sharing class EditAccountTeamMemberController
{
    private String teamMemberId;
    
    public EditAccountTeamMemberController(ApexPages.StandardController std)
    {
        teamMemberId = std.getId();
        init();
    }
    
    public AccountTeamMember CurrentTeamMember {get; set;}
    
    private void init()
    {
        CurrentTeamMember = [select UserId, TeamMemberRole, AccountId from AccountTeamMember where Id = :teamMemberId];
    }
    
    public PageReference saveTeamMember()
    {
        update CurrentTeamMember;
        PageReference pageRef = Page.AccountTeam;
        pageRef.getParameters().put('id', CurrentTeamMember.AccountId);
        return pageRef;
    }
    
    public PageReference cancelTeamMember()
    {
        PageReference pageRef = Page.AccountTeam;
        pageRef.getParameters().put('id', CurrentTeamMember.AccountId);
        return pageRef;
    }

}