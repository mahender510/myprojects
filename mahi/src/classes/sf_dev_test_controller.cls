public class sf_dev_test_controller {
    public String cont_role {get; set;}
    public String email {get; set;}
    public String job_title {get; set;}
    public String first_name {get; set;}
    public String last_name {get; set;}
    public String phone_num {get; set;}
    public String assistant {get; set;}
    
    public sf_dev_test_controller() {
        
    }
    public void email()
    {
        if( String.isBlank( email ) ) {
            ApexPages.addMessage( new ApexPages.Message(ApexPages.Severity.FATAL, 'Email is a required field.' ) ); 
        } else {
            if( !( email.contains( '@' ) ) ) {
                ApexPages.addMessage( new ApexPages.Message(ApexPages.Severity.FATAL, 'Enter a valid email address.' ) ); 
            }
        }
    }public void firstName()
    {
        if( String.isBlank( first_name ) ) {
            ApexPages.addMessage( new ApexPages.Message(ApexPages.Severity.FATAL, 'First Name is a required field.' ) );
        } else {
            if( first_name.length() > 40 ) {
                ApexPages.addMessage( new ApexPages.Message(ApexPages.Severity.FATAL, 'First Name is limited to 40 characters.' ) );
            }
        }
    }public void lastName()
    {
        if( String.isBlank( last_name ) ) {
            ApexPages.addMessage( new ApexPages.Message(ApexPages.Severity.FATAL, 'Last Name is a required field.' ) );
        } else {
            if( last_name.length() > 80 ) {
                ApexPages.addMessage( new ApexPages.Message(ApexPages.Severity.FATAL, 'Last Name is limited to 80 characters.' ) );
            }
        }
    }public void phoneNum()
    {
        if( String.isBlank( phone_num ) ) {
            ApexPages.addMessage( new ApexPages.Message( ApexPages.Severity.FATAL, 'Phone Number is a required field.' ) );
        }
    }public void jobTitle()
    {
        if( String.isBlank( job_title ) ) {
            ApexPages.addMessage( new ApexPages.Message( ApexPages.Severity.FATAL, 'Job Title is a required field.' ) );
        }
    }public void asstName()
    {
        if( String.isBlank( assistant ) ) {
            ApexPages.addMessage( new ApexPages.Message(                     ApexPages.Severity.FATAL, 'Assistant is a required field.' ) );
        }
    }
    public void create_contact() {
        // Field Checks for Technical Role
        if( String.isBlank( cont_role ) ) {
            //ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL, 'You must select a Contact Role.')); 
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.FATAL,'You must select a Contact Role'));
        } else if( cont_role == 'TECH' ) {
            email();
            firstName();
            lastName();
            phoneNum();
            jobTitle();
            // Field Checks for Exectuive Role   
        } else if( cont_role == 'EXEC' ) {
            email();
            firstName();
            lastName();
            phoneNum();
            jobTitle();
            asstName();
            
            // Field Checks for Customer Role
        } else if( cont_role == 'CUST' ) {
            email();
            firstName();
            lastName();
            phoneNum();    
            // Field Checks for Unknown Role
        } else if( cont_role == 'UNKNOWN' ) {
            email();
            firstName();
            lastName();
        }
        // Insert Contact into Database
        if( ApexPages.getMessages().size() == 0 ) {
            Contact con = new Contact();
            con.Department = cont_role;
            con.Email = email;
            con.FirstName = first_name;
            con.LastName = last_name;
            con.Title = job_title;
            con.AssistantName = assistant;
            con.Phone = phone_num;
            
            Database.insert( con );
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.FATAL,'Contact Id created is'+con.id));
            cont_role = '';
            email = '';
            first_name = '';
            last_name = '';
            job_title = '';
            assistant = '';
            phone_num = '';
        }
    }
}