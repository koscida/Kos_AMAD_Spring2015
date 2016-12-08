package com.example.kosba.kos_final_exam;

import android.app.ListActivity;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class SportsListActivity extends ListActivity {

    private String workoutTypeName;
    private int workoutTypeID;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Intent i = getIntent();
        workoutTypeName = (String) i.getExtras().get("workoutTypeName");
        workoutTypeID   = (Integer)i.getExtras().get("workoutTypeID");

        //get the list view
        ListView listSports = getListView();

        //define an array adapter
        ArrayAdapter<Sports> listAdapter;

        //initialize the array adapter with the right list of sports
        switch (workoutTypeName){
            case "Cardio":
                listAdapter = new ArrayAdapter<Sports>(this, android.R.layout.simple_list_item_1, Sports.cardio);
                break;
            case "Strength":
                listAdapter = new ArrayAdapter<Sports>(this, android.R.layout.simple_list_item_1, Sports.strength);
                break;
            case "Flexibility":
            default:
                listAdapter = new ArrayAdapter<Sports>(this, android.R.layout.simple_list_item_1, Sports.flexibility);
                break;

        }

        //set the array adapter on the list view
        listSports.setAdapter(listAdapter);
    }

    @Override
    public void onListItemClick(ListView listView, View view, int position, long id){
        Intent intent = new Intent(SportsListActivity.this, SportDetailActivity.class);
        intent.putExtra("workoutTypeName", workoutTypeName);
        intent.putExtra("workoutTypeID", workoutTypeID);
        intent.putExtra("sportID", (int)id);
        startActivity(intent);
    }

}
