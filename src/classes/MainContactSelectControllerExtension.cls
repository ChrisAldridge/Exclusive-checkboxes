public class MainContactSelectControllerExtension 
{
    public List<Contact> AccountContacts { get; set; }

    public Contact MainContact { get; set; }

    public MainContactSelectControllerExtension(ApexPages.StandardController controller) 
    {
        Id accountId = controller.getId();

        // Retrieve all contacts or this account
        AccountContacts = [SELECT Id, Name, Email, Main_Contact__c
                           FROM Contact
                           WHERE AccountId = :accountId];

        // If a main contact is already set for this account, display ot
        SetMainContact();
    }

    // When a checkbox is changed, find the main contact
    public void SetMainContact()
    {
        MainContact = null;

        for (contact con : AccountContacts)
        {
                if (con.Main_Contact__c)
                        MainContact = con;
        }
    }
}