CREATE OR REPLACE FUNCTION Check_Loan_Eligibility (
    p_customer_id IN NUMBER,
    p_loan_amount IN NUMBER
) RETURN VARCHAR2 IS
    v_salary NUMBER;
    v_credit_score NUMBER;
BEGIN
    -- Fetch customer details (assuming Customers table has Salary and Credit_Score columns)
    SELECT Salary, Credit_Score INTO v_salary, v_credit_score
    FROM Customers
    WHERE Customer_ID = p_customer_id;

    -- Eligibility criteria
    IF v_salary < 30000 THEN
        RETURN 'Not Eligible: Salary below minimum requirement.';
    ELSIF v_credit_score < 700 THEN
        RETURN 'Not Eligible: Credit score too low.';
    ELSIF p_loan_amount > (v_salary * 10) THEN
        RETURN 'Not Eligible: Loan amount exceeds limit.';
    ELSE
        RETURN 'Eligible';
    END IF;
END;
/
