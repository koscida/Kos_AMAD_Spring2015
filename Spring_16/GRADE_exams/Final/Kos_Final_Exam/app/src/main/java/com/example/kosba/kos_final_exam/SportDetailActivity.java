package com.example.kosba.kos_final_exam;

import android.app.Activity;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.ImageView;
import android.widget.TextView;

public class SportDetailActivity extends Activity {

    private String workoutTypeName;
    private int workoutTypeID;
    private int sportID;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sport_detail);

        //get bulb data from the intent
        Intent i = getIntent();
        workoutTypeName = (String) i.getExtras().get("workoutTypeName");
        workoutTypeID   = (Integer)i.getExtras().get("workoutTypeID");
        sportID         = (Integer)i.getExtras().get("sportID");

        WorkoutType workoutType = WorkoutType.allTypes[workoutTypeID];

        //populate name
        TextView bulbName = (TextView)findViewById(R.id.sportName);
        bulbName.setText(workoutType.sports[sportID].getName());

        //populate image
        ImageView sportImage = (ImageView)findViewById(R.id.sportImageView);
        sportImage.setImageResource(workoutType.getImageResourceID());
        Log.v("---------------", "index=" + workoutType.getImageResourceID());

    }
}
