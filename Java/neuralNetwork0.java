import java.util.Random;

public class neuralNetwork0 {
    public static void main(String[] args) {
        // Initialize inputs
        double[] inputs = {1.0, 2.0, 3.0, 2.5};

        // Randomly initialize weights
        double[] weights1 = new double[4];
        double[] weights2 = new double[4];
        double[] weights3 = new double[4];
        initializeWeights(weights1);
        initializeWeights(weights2);
        initializeWeights(weights3);

        // Biases initialized as 0
        double bias1 = 0;
        double bias2 = 0;
        double bias3 = 0;

        // Calculate output
        double[] output = new double[3];
        output[0] = calculateOutput(inputs, weights1, bias1);
        output[1] = calculateOutput(inputs, weights2, bias2);
        output[2] = calculateOutput(inputs, weights3, bias3);

        // Display the output
        System.out.printf("The output is: [%.4f, %.4f, %.4f]%n", output[0], output[1], output[2]);
    }

    // Method to calculate the output using inputs, weights, and bias
    public static double calculateOutput(double[] inputs, double[] weights, double bias) {
        double output = 0;
        for (int i = 0; i < inputs.length; i++) {
            output += inputs[i] * weights[i];
        }
        return output + bias;
    }

    // Method to randomly initialize weights
    public static void initializeWeights(double[] weights) {
        Random rand = new Random();
        for (int i = 0; i < weights.length; i++) {
            weights[i] = rand.nextDouble(); // Generate random double between 0 and 1
        }
    }
}
