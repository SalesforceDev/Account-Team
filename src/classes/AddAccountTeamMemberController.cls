public with sharing class AddAccountTeamMemberController
{
    private String accId;

    public AddAccountTeamMemberController(ApexPages.StandardController std)
    {
        accId = std.getId();
        initData();
    }
    
    public AccountTeamMember CurrentAccountTeamMember {get; set;}

    public void initData()
    {
        CurrentAccountTeamMember = new AccountTeamMember(AccountId = accId);
    }

    public PageReference saveTeamMember()
    {
        
        if(CurrentAccountTeamMember.UserId != null && String.isEmpty(CurrentAccountTeamMember.TeamMemberRole))
        {
            CurrentAccountTeamMember.TeamMemberRole.addError('You must enter a value.');
            return null;
        }
        try
        {
            insert CurrentAccountTeamMember;
        }
        catch(Exception ex)
        {
            return null;
        }
        PageReference pageRef = Page.AccountTeam;
        pageRef.getParameters().put('id', accId);
        return pageRef;
    }
    
    public void saveAndNewTeamMember()
    {
        if(saveTeamMember() != null)
        {
            initData();
        }
    }
    
    public PageReference cancelTeamMember()
    {
        PageReference pageRef = Page.AccountTeam;
        pageRef.getParameters().put('id', accId);
        return pageRef;
    }
}