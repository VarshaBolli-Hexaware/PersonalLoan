CREATE OR REPLACE PROCEDURE CreateLoanProcessingTables AS
BEGIN
    -- Create Customers Table
    EXECUTE IMMEDIATE ' 
        CREATE TABLE Customers ( 
            Customer_ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
            Name VARCHAR2(100), 
            Address VARCHAR2(200), 
            Phone_Number VARCHAR2(15), 
            Email VARCHAR2(100), 
            Salary NUMBER, 
            Credit_Score NUMBER 
        ) 
    ';

    -- Create Loan_Applications Table
    EXECUTE IMMEDIATE ' 
        CREATE TABLE Loan_Applications ( 
            Application_ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
            Customer_ID NUMBER REFERENCES Customers(Customer_ID), 
            Loan_Amount NUMBER, 
            Loan_Term NUMBER, 
            Application_Date DATE, 
            Application_Status VARCHAR2(20) 
        ) 
    ';

    -- Create Disbursed_Loans Table
    EXECUTE IMMEDIATE ' 
        CREATE TABLE Disbursed_Loans ( 
            Disbursement_ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
            Application_ID NUMBER REFERENCES Loan_Applications(Application_ID), 
            Disbursement_Date DATE, 
            Disbursed_Amount NUMBER 
        ) 
    ';

    DBMS_OUTPUT.PUT_LINE('Tables created successfully.');
	
	Submit_Loan_Application;
	
	Check_Loan_Eligibility;
	
	Approve_Or_Reject_Loan;
	
	Disburse_LoanDisburse_Loan;
	
END CreateLoanProcessingTables;
/


