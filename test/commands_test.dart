import 'dart:math';

import 'package:calculator_cli/commands.dart';
import 'package:calculator_cli/calculator_state.dart';
import 'package:test/test.dart';

void main() {


  [test("Enter: checks if new stack is given and is saved in history", () {

    num number = 4;

    CalculatorState state = CalculatorState.empty();

    state = Enter(number).execute(state);

    //new number saved in stack
    expect(state, isNot(CalculatorState.empty()));
    expect(state.stack.length, 1);
    expect(state.stack.first, number);

    //new stack saved in history
    //expect(state.stack, state.history.first);

  })];

  [test("Clear: checks that Clear clears the state", () {
    num number = 5;

    CalculatorState state = CalculatorState.empty();

    CalculatorState middleState = Enter(number).execute(state);

    CalculatorState endState = Clear().execute(middleState);

    expect(endState, isNot(middleState));
    expect(endState.stack, isEmpty);
    expect(endState.history, isEmpty);
  })];

  [test("Undo: checks that undo restored the previous state", () {
    num number = 5;

    CalculatorState state = CalculatorState.empty();

    CalculatorState middleState = Enter(number).execute(state);

    CalculatorState middleState2 = Enter(number).execute(middleState);

    CalculatorState endState = Undo().execute(middleState2);

    expect(endState.stack, middleState.stack);

  })];
  
  [test("Add: checks that nums r added & history is updated", (){
    num number = 67;
    List<num> startingValues = [2,4];

    CalculatorState state = CalculatorState(stack: startingValues, history: [[], [startingValues.first]]);

    state = Enter(number).execute(state);
    state = Add().execute(state);

    expect(state.history.last, [...startingValues, number]);
    expect(state.stack.last, number+startingValues.last);

  })];

  [test("Add: checks if nothing is done when stack length is less than 2", (){

    CalculatorState state = CalculatorState(stack: [6], history: [[]]);

    CalculatorState newState = Add().execute(state);

    expect(newState, state);
    expect(newState.stack, state.stack);
    expect(newState.history, state.history);
    
  })];

  [test("Subtract: checks that nums r subtracted & history is updated", (){
    num number = 22;
    List<num> startingValues = [16,14];

    CalculatorState state = CalculatorState(stack: startingValues, history: [[], [startingValues.first]]);

    state = Enter(number).execute(state);
    state = Subtract().execute(state);

    expect(state.history.last, [...startingValues, number]);
    expect(state.stack.last, startingValues.last-number);

  })];

  [test("Subtract: checks if nothing is done when stack length is less than 2", (){

    CalculatorState state = CalculatorState(stack: [6], history: [[]]);

    CalculatorState newState = Subtract().execute(state);

    expect(newState, state);
    expect(newState.stack, state.stack);
    expect(newState.history, state.history);

  })];

  [test("Multiply: checks that nums r multiplied & history is updated", (){
    num number = 22;
    List<num> startingValues = [16,14];

    CalculatorState state = CalculatorState(stack: startingValues, history: [[], [startingValues.first]]);

    state = Enter(number).execute(state);
    state = Multiply().execute(state);

    expect(state.history.last, [...startingValues, number]);
    expect(state.stack.last, startingValues.last * number);

  })];

  [test("Mutliply: checks if nothing is done when stack length is less than 2", (){

    CalculatorState state = CalculatorState(stack: [6], history: [[]]);

    CalculatorState newState = Multiply().execute(state);

    expect(newState, state);
    expect(newState.stack, state.stack);
    expect(newState.history, state.history);

  })];

  [test("Divide: checks that nums r multiplied & history is updated", (){
    num number = 22;
    List<num> startingValues = [16,14];

    CalculatorState state = CalculatorState(stack: startingValues, history: [[], [startingValues.first]]);

    state = Enter(number).execute(state);
    state = Divide().execute(state);

    expect(state.history.last, [...startingValues, number]);
    expect(state.stack.last, startingValues.last / number);

  })];

  [test("Divide: checks if nothing is done when stack length is less than 2", (){

    CalculatorState state = CalculatorState(stack: [6], history: [[]]);

    CalculatorState newState = Divide().execute(state);

    expect(newState, state);
    expect(newState.stack, state.stack);
    expect(newState.history, state.history);

  })];





  /* TODO write tests for commands
   *
   * - Enter
   *   - a new stack with given value at the end and old stack in history
   * - Clear
   *   - an empty state
   * - Undo
   *   - previous state restored from history
   * - Add
   *   - stack with the last two values added, and history so that the old state can be restored
   *   - does nothing when stack length is less than 2
   * - Subtract
   *   - stack with the last two values subtracted, and history so that old state
   *     can be restored
   *   - does nothing when stack length is less than 2
   * - Multiply
   *   - stack with the last two values multiplied, and history so that old state
   *   - does nothing when stack length is less than 2
   * - Divide
   *   - stack with the last two values divided, and history so that old state
   *   - does nothing when stack length is less than 2
  */
}
