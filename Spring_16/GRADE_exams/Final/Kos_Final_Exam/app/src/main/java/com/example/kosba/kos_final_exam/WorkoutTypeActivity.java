package com.example.kosba.kos_final_exam;

import android.app.Activity;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

public class WorkoutTypeActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_workout_type);

        //create listener
        AdapterView.OnItemClickListener itemClickListener = new AdapterView.OnItemClickListener() {
            public void onItemClick(AdapterView<?> listView, View view, int position, long id) {
                String workoutTypeName = (String) listView.getItemAtPosition(position);

                //create new intent
                Intent intent = new Intent(WorkoutTypeActivity.this, SportsListActivity.class);

                //add bulbtype to intent
                intent.putExtra("workoutTypeName", workoutTypeName);
                intent.putExtra("workoutTypeID", (int)id);

                //start intent
                startActivity(intent);
            }
        };

        //get the list view
        ListView listview = (ListView) findViewById(R.id.workTypeListView);

        //add listener to the list view
        listview.setOnItemClickListener(itemClickListener);


    }



    public boolean onCreateOptionsMenu(Menu menu){
        //inflate menu to add items to the action bar
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return super.onCreateOptionsMenu(menu);
    }

    public boolean onOptionsItemSelected(MenuItem item) {
        //get the ID of the item on the action bar that was clicked
        switch (item.getItemId()){
            case R.id.signupOption:
                Intent intent = new Intent(this, SignupActivity.class);
                startActivity(intent);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

}
