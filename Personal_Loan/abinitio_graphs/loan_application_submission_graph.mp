graph loan_application_submission_graph
{
    # Define your components
    run_program("/home/db_scripts/execute_loan_scripts.sh") {
        parameters("DB_USER=loan_user", 
                   "DB_PASSWORD=loan_password", 
                   "DB_CONNECTION=oracle_db_connection", 
                   "SCRIPT_DIR=/home/db_scripts", 
                   "PROCEDURE_NAME=CreateLoanProcessingTables");
        out0("execution_logs");
        err0("error_logs");
    }

    output_file("sucess_logs.txt") {
        in0("execution_logs");
    }

    error_file("errors_logs.txt") {
        in0("error_logs");
    }

    # Connect components
    run_program.out0 -> output_file.in0;
    run_program.err0 -> error_file.in0;
}
