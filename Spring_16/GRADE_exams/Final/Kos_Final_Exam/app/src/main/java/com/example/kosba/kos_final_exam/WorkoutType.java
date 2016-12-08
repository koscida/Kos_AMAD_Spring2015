package com.example.kosba.kos_final_exam;

/**
 * Created by kosba on 4/28/16.
 */
public class WorkoutType {

    public String name;
    public int imageResourceID;
    public Sports[] sports;

    private WorkoutType(String newname, int newID, Sports[] newSports){
        this.name = newname;
        this.imageResourceID = newID;
        this.sports = newSports;
    }

    public static final WorkoutType[] allTypes = {
        new WorkoutType("Cardio", R.drawable.cardio, Sports.cardio),
        new WorkoutType("Strength", R.drawable.strength, Sports.strength),
        new WorkoutType("Flexibility", R.drawable.flexibility, Sports.flexibility)
    };

    public String getName(){
        return name;
    }
    public int getImageResourceID(){
        return imageResourceID;
    }
    //the string representation of a tulip is its name
    public String toString(){
        return this.name;
    }

}
