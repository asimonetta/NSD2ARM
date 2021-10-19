package lu.fisch.turtle;

import lu.fisch.diagrcontrol.DiagramController;
import lu.fisch.structorizer.arranger.Arranger;
import lu.fisch.structorizer.elements.Instruction;
import lu.fisch.structorizer.elements.Root;
import lu.fisch.utils.Registers;

import java.awt.*;
import java.lang.reflect.Method;
import java.util.HashMap;

public class ArmController implements DiagramController {
    private static final HashMap<String, Method> armProcedures = new HashMap<>();
    private static final HashMap<String, Method> armFunctions = new HashMap<>();

    static {
        try {
            armFunctions.put("mov#1", ArmController.class.getMethod("mov", String.class));
            armProcedures.put("mov#2", ArmController.class.getMethod("mov", String.class, String.class));
            armProcedures.put("loadarranger#0", ArmController.class.getMethod("loadArranger"));
            armProcedures.put("arm#1", ArmController.class.getMethod("arm", String.class));
        } catch (NoSuchMethodException | SecurityException ex) {
            ex.printStackTrace();
        }
    }

    public ArmController() {

    }

    @Override
    public HashMap<String, Method> getFunctionMap() {
        return armFunctions;
    }

    @Override
    public HashMap<String, Method> getProcedureMap() {
        return armProcedures;
    }

    @Override
    public String execute(String message) {
        return null;
    }

    @Override
    public String execute(String message, Color color) {
        return null;
    }

    @Override
    public void setName(String name) {
    }

    public String mov(String from) {
        String result = from;
        String val = Registers.registers.get(from);

        if (val != null)
            result = val;

        return result;
    }

    public void mov(String to, String from) {
        String result = from;
        String val = Registers.registers.get(from);

        if (val != null)
            result = val;

        Registers.registers.put(to, result);
    }

    public void loadArranger() {
        Arranger arranger = Arranger.getInstance();
        Root root = new Root();
        root.setText("add(x, y)");
        root.addAfter(root.children, new Instruction("RETURN x + y"));
        arranger.addDiagram(root);

        root = new Root();
        root.setText("sub(x, y)");
        root.addAfter(root.children, new Instruction("RETURN x - y"));
        arranger.addDiagram(root);

        root = new Root();
        root.setText("mul(x, y)");
        root.addAfter(root.children, new Instruction("RETURN x * y"));
        arranger.addDiagram(root);
    }

    public void arm(String instruction) {
        instruction = instruction.replace(" ", "").replace("#", "");
        String[] tokens = instruction.split(",");

        if (instruction.contains("MOV")) {
            String register = tokens[0];
            String value = tokens[1];
            String registerValue = Registers.registers.get(value);

            if (registerValue != null)
                value = registerValue;

            Registers.registers.put(register, value);
        }

        if (instruction.contains("ADD")) {
            String register = tokens[0].replace("ADD", "");
            String firstOperator = tokens[1];
            String secondOperator = tokens[2];
            String firstValue = Registers.registers.get(firstOperator);
            String secondValue = Registers.registers.get(secondOperator);

            if (firstValue != null)
                firstOperator = firstValue;

            if (secondValue != null)
                secondOperator = secondValue;

            Registers.registers.put(register, "" + (Integer.parseInt(firstOperator) + Integer.parseInt(secondOperator)));
        }

        if (instruction.contains("SUB")) {
            String register = tokens[0].replace("SUB", "");
            String firstOperator = tokens[1];
            String secondOperator = tokens[2];
            String firstValue = Registers.registers.get(firstOperator);
            String secondValue = Registers.registers.get(secondOperator);

            if (firstValue != null)
                firstOperator = firstValue;

            if (secondValue != null)
                secondOperator = secondValue;

            Registers.registers.put(register, "" + (Integer.parseInt(firstOperator) - Integer.parseInt(secondOperator)));
        }
    }
}