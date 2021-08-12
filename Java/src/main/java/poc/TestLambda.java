package poc;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TestLambda implements RequestHandler<Object, OutputObject>{

    static DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

    static int staticVarCount = 0;
    int instanceVarCount = 0;
    String dateTime;


    public TestLambda(){
        super();
        dateTime = formatter.format(new Date());
    }

    public OutputObject handleRequest(final Object event, final Context context) {

        staticVarCount++;
        instanceVarCount++;

        final String rsBody = "Java Lambda:\n"
                            + "I've seen that static variable " + staticVarCount + " time(s).\n"
                            + "I've seen that instance variable " + instanceVarCount + " times(s).\n"
                            + "First invoked = " + dateTime;

        System.out.println(rsBody);
        return new OutputObject(200, rsBody);
    }
}
