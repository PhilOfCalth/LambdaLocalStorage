package poc;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;

public class TestLambda implements RequestHandler<Object, OutputObject>{

    static int staticVarCount = 0;
    int instanceVarCount = 0;

    public OutputObject handleRequest(final Object event, final Context context) {

        staticVarCount++;
        instanceVarCount++;

        final String rsBody = "Java Lambda:\n"
                            + "I've seen that static variable " + staticVarCount + " time(s).\n"
                            + "I've seen that instance variable " + instanceVarCount + " times(s).";

        System.out.println(rsBody);
        return new OutputObject(200, rsBody);
    }
}
