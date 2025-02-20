package models;

public class Customer {
    private String accId;
    private float totalSpent;

    // Constructor
    public Customer(String accId, float totalSpent) {
        this.accId = accId;
        this.totalSpent = totalSpent;
    }

    // Getter cho AccId
    public String getAccId() {
        return accId;
    }

    // Getter cho TotalSpent
    public float getTotalSpent() {
        return totalSpent;
    }
}
