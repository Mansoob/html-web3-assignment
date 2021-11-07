pragma solidity 0.8.7;

contract expenseTraker {
    
    int totalIncome;
    int totalExpenses;
    int balance;
    uint id = 0;

    struct Data {
        uint id;
        string description;
        int amount;
    }

    Data[] public data;

    function getTotalIncome () public view returns (int){
        return(totalIncome);
    }
    
    function getTotalExpense () public view returns (int){
        return(totalExpenses);
    }
    
    function getBalance () public view returns (int){
        return(balance);
    }

    function getTotalTrx() public view returns (uint) {
        return data.length;
    }
    
    function getTrxDetails(uint _id) public view returns (uint getId, string memory getDescription, int getAmount) {
        Data storage allData = data[_id];
        getId = allData.id;
        getDescription = allData.description;
        getAmount = allData.amount;
    }

    event transaction(uint id, string, string description, int amount);

       function addTransaction(string memory _description, int _amount) public {
        data.push(Data(id, _description, _amount));
        id++;
            
        if (_amount > 0) {
            totalIncome = totalIncome + _amount;
            balance = totalIncome - totalExpenses;
            emit transaction(id, "Income", _description, _amount);
        }
        
        else (totalExpenses = totalExpenses + _amount);
        balance = totalIncome + totalExpenses;
        emit transaction(id, "Expense", _description, _amount);
    }
}