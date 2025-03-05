CREATE OR REPLACE PROCEDURE Disburse_Loan (
    p_application_id IN NUMBER
) IS
    v_status VARCHAR2(10);
    v_loan_amount NUMBER;
BEGIN
    -- Check loan application status
    SELECT Application_Status, Loan_Amount INTO v_status, v_loan_amount
    FROM Loan_Applications
    WHERE Application_ID = p_application_id;

    IF v_status = 'Approved' THEN
        -- Insert into Disbursed_Loans table
        INSERT INTO Disbursed_Loans (
            Disbursement_ID, Application_ID, Disbursement_Date, Disbursed_Amount
        ) VALUES (
            SEQ_DISBURSEMENT_ID.NEXTVAL, p_application_id, SYSDATE, v_loan_amount
        );

        DBMS_OUTPUT.PUT_LINE('Loan disbursed successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Loan cannot be disbursed. Application is not approved.');
    END IF;
END;
/
