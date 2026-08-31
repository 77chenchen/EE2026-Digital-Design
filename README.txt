EE2026 LAB 2 GPT-2 - WANG QICHEN_536

Personalisation used:
  Matriculation number: A0337219B
  Third-rightmost digit: 2
  Second-rightmost digit: 1
  Complete adder width: 6 bits
  Structural split: 2 most-significant bits and 4 least-significant bits
  Pushbutton role: BTNR, exposed as the required top-level port pb
  Alternate result: DR divided by 2 using {1'b0, DR[5:1]}
  Result selection: assign S = pb ? AR : DR
  Initial an: 4'b1110
  Pressed an: 4'b0001
  Anode selection: assign an = pb ? inverted_an : initial_an
  seg: 8'b10100001 (lowercase d on AN0)

Vivado 2025.2:
  1. Start Vivado and change the Tcl Console directory to this folder.
  2. Run: source create_vivado_project.tcl
  3. In the Wave window show only A, B, pb, S, an, seg.
  4. Do not expand buses; set every waveform radix to Unsigned Decimal.
  5. Verify that all ten cases from 0 ns through 180 ns are readable.
  6. Take the required single unedited Vivado screenshot.
  7. Use File > Project > Archive and ensure the archive is below 5 MB.

Automated verification result: PASS for all ten test cases.
