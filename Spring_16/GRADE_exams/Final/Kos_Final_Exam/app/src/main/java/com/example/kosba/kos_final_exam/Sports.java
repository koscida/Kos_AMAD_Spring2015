package com.example.kosba.kos_final_exam;

/**
 * Created by kosba on 4/28/16.
 */
public class Sports {

    public String name;

    //constructor
    private Sports(String newname){
        this.name = newname;
    }

    public static final Sports[] cardio = {
            new Sports("Running"),
            new Sports("Jogging")
    };
    public static final Sports[] strength = {
            new Sports("Lifting"),
            new Sports("Something else, I don\'t know, I don\'t do sports")
    };
    public static final Sports[] flexibility = {
            new Sports("Yoga"),
            new Sports("Another type of yoga")
    };

    public String getName(){
        return name;
    }

    //the string representation of a tulip is its name
    public String toString(){
        return this.name;
    }
}
