@isTest
public class TestAccountTeam
{
    @isTest
    public static void testAccountTeamController()
    {
        Account acc = new Account(Name = 'Test Acme');
        insert acc;
        ApexPages.StandardController std = new ApexPages.StandardController(acc);
        AccountTeamController accClass = new AccountTeamController(std);
        
        AccountTeamMember accTeamMember = new AccountTeamMember(UserId = UserInfo.getUserId(), AccountId = acc.Id);
        insert accTeamMember;
        
        accClass.AccountTeamMemberId = accTeamMember.Id;
        
        accClass.editAccountTeamMember();
        
        accClass.addAccountTeamMembers();
        
        accClass.delAccountTeamMember();
        
        accClass.deleteAll();
    }
    
    @isTest
    public static void testAddAccountTeamMemberController()
    {
        Account acc = new Account(Name = 'Test Acme');
        insert acc;
        ApexPages.StandardController std = new ApexPages.StandardController(acc);
        AddAccountTeamMemberController accClass = new AddAccountTeamMemberController(std);
        
        accClass.cancelTeamMember();
        accClass.saveAndNewTeamMember();
        accClass.CurrentAccountTeamMember = new AccountTeamMember(UserId = UserInfo.getUserId(), AccountId = acc.Id);
        
        accClass.saveTeamMember();
    }
    
    @isTest
    public static void testEditAccountTeamMemberController()
    {
        Account acc = new Account(Name = 'Test Acme');
        insert acc;
        AccountTeamMember accTeamMember = new AccountTeamMember(UserId = UserInfo.getUserId(), AccountId = acc.Id);
        insert accTeamMember;
        ApexPages.StandardController std = new ApexPages.StandardController(accTeamMember);
        EditAccountTeamMemberController accClass = new EditAccountTeamMemberController(std);
        
        accClass.cancelTeamMember();
        accClass.saveTeamMember();
    }
}