CREATE OR REPLACE PROCEDURE Approve_Or_Reject_Loan (
    p_application_id IN NUMBER
) IS
    v_customer_id NUMBER;
    v_loan_amount NUMBER;
    v_eligibility_status VARCHAR2(50);
BEGIN
    -- Fetch application details
    SELECT Customer_ID, Loan_Amount INTO v_customer_id, v_loan_amount
    FROM Loan_Applications
    WHERE Application_ID = p_application_id;

    -- Check eligibility
    v_eligibility_status := Check_Loan_Eligibility(v_customer_id, v_loan_amount);

    -- Approve or reject based on eligibility
    IF v_eligibility_status = 'Eligible' THEN
        UPDATE Loan_Applications
        SET Application_Status = 'Approved'
        WHERE Application_ID = p_application_id;

        DBMS_OUTPUT.PUT_LINE('Loan application approved.');
    ELSE
        UPDATE Loan_Applications
        SET Application_Status = 'Rejected'
        WHERE Application_ID = p_application_id;

        DBMS_OUTPUT.PUT_LINE('Loan application rejected: ' || v_eligibility_status);
    END IF;
END;
/
