# Adjustable current limit: potentiometer and load diagnostics

## Separate setpoint direction from limiting behavior
- Identify potentiometer pins with power OFF: end-to-end fixed resistance; wiper-to-each-end changes in opposite directions as the shaft rotates.
- If current adjustment works but rotation direction is reversed, swapping the two end terminals usually reverses direction while retaining the wiper connection. Verify the exact comparator topology before changing wiring.
- Do not interchange a wiper and end terminal arbitrarily: the resulting divider range and fault behavior can change, and the adjustment may become ineffective.
- Measure the voltage at the potentiometer wiper, comparator input(s), shunt, comparator output, and regulator enable/control pin against the correct reference ground.
- A wiper that changes while the comparator input remains fixed suggests an open circuit, wrong pin/net, loading, or reference mismatch.
- Check LM358 input common-mode and output swing, comparator polarity, supply voltage, and the regulator's actual ON/OFF pin logic from its datasheet.

## Load and short-circuit tests
- A dead-short current value is not necessarily the sustainable regulated current at a finite output voltage. Buck duty cycle, sense location, thermal limits, and supply current limits differ.
- Sustained short current above the intended limit indicates a protection fault; stop the test and isolate the current-limit loop before prolonged operation.
- Use a current-limited bench supply, electronic load with calibrated current readback, thermal monitoring, and short-duration tests. Never use an uncontrolled sustained short as a normal calibration method.
- Record at each setpoint: VIN, VOUT at terminals, load voltage, output current, shunt drop, control voltages, and temperature.
- Distinguish constant-current regulation from output-voltage collapse, wiring resistance, thermal shutdown, and inductor saturation.

## Verification
Test adjustment endpoints and intermediate positions at several output voltages and loads. Verify clockwise direction, monotonic current limit, reproducibility, and safe behavior if the wiper disconnects. Do not assume an advertised current rating is thermally sustainable without testing.
