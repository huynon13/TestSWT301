package models; // Đảm bảo đúng package

public class Revenue {
    private int year;
    private int month;
    private float monthlyRevenue;

    public Revenue(int year, int month, float monthlyRevenue) {
        this.year = year;
        this.month = month;
        this.monthlyRevenue = monthlyRevenue;
    }

    public int getYear() {
        return year;
    }

    public int getMonth() {
        return month;
    }

    public float getMonthlyRevenue() {
        return monthlyRevenue;
    }
}
