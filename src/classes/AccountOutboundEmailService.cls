public class AccountOutboundEmailService {
    
    public static void createAccountAndEmail() {
    
        Account acc = new Account();
        acc.Name = 'Ravi';
        insert acc;
        
        Messaging.reserveSingleEmailCapacity(1);
        
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        
        String[] toAddresses = new String[] { 'ravikiran.telu@gmail.com' };
        String[] ccAddresses = new String[] { 'ravikiran.telu@gmail.com' };
        
        email.setToAddresses(toAddresses);
        email.setCCAddresses(ccAddresses);
        
        email.setReplyTo('ravikiran.telu@gmail.com');
        
        email.setSenderDisplayName('Kiran@SalesforceDeveloperOutboundSingleEmailService');
        
        email.setSubject('New Account is created');
        
        email.setBCCSender(false);
        
        email.setPlainTextBody('Your Account has been created');
        
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });        
        
    }
    
}