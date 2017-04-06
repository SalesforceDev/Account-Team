public with sharing class AddAccountTeamMemberController
{
	private String accId;

    public AddAccountTeamMemberController(ApexPages.StandardController std)
    {
    	accId = std.getId();
    	initData();
    }

    public List<AccountTeamMember> AccountTeamMembers {get; set;}

    public void initData()
    {
    	AccountTeamMembers = new List<AccountTeamMember>();
    	for(Integer i = 0; i < 5; i++)
    	{
    		AccountTeamMember teamMember = new AccountTeamMember(AccountId = accId);
    		AccountTeamMembers.add(teamMember);
    	}
    }

    public void saveTeamMember()
    {

    }

    public void saveAndMoreTeamMember()
    {
    	
    }

    public PageReference cancelTeamMember()
    {
    	PageReference pageRef = Page.AccountTeam;
        pageRef.getParameters().put('id', accId);
        return pageRef;
    }
}