-- allow a customer to submit a loan application.
CREATE OR REPLACE PROCEDURE Submit_Loan_Application (
    p_customer_id IN NUMBER,
    p_loan_amount IN NUMBER,
    p_loan_term IN NUMBER
) IS
BEGIN
    INSERT INTO Loan_Applications (
        Application_ID, Customer_ID, Loan_Amount, Loan_Term, Application_Date, Application_Status
    ) VALUES (
        SEQ_APPLICATION_ID.NEXTVAL, p_customer_id, p_loan_amount, p_loan_term, SYSDATE, 'Pending'
    );

    DBMS_OUTPUT.PUT_LINE('Loan application submitted successfully.');
END;
/
