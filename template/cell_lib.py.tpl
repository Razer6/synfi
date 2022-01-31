
# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
# "THIS FILE HAS BEEN GENERATED, DO NOT EDIT MANUALLY.
# COMMAND: ./cell_lib_generator.py -l NangateOpenCellLibrary_typical.lib 
#                                  -c examples/config.json 
#                                  -o cell_lib_nangate45_autogen.py

import logging

import networkx as nx

"""Part of the fault injection framework for the OpenTitan.

This library provides the mapping for a gate type of the Nangate45 library to a
boolean formula in CNF.
"""
logger = logging.getLogger(__name__)

# The number is the variable name of a logical 0/1 used by the SAT solver.
one = 1
zero = 2

registers = ${cell_lib.reg}

gate_in_type = {
% for cell_name, out_type in cell_lib.type_mapping.gate_in_type.items():
  '${cell_name}': '${out_type}',
% endfor
  'prim_flop': 'OTFI_D1',
  'prim_flop_fault': 'OTFI_D1',
  'prim_buf': 'OTFI_I1',
  'prim_buf_fault': 'OTFI_I1',
  'out_node': 'OTFI_D1',
  'xnor': 'OTFI_I2',
  'xor': 'OTFI_I2',
  'input_formula': 'OTFI_I1',
  'in_node': 'OTFI_I1',
  'output': 'OTFI_I1',
  'input': 'OTFI_I1',
  'input_fault': 'OTFI_I1'
}

gate_in_type_out = {
% for cell_name, out_type in cell_lib.type_mapping.gate_in_type_out.items():
  '${cell_name}': '${out_type}',
% endfor
  'prim_flop': 'OTFI_D1',
  'prim_flop_fault': 'OTFI_D1',
  'prim_buf': 'OTFI_I1',
  'prim_buf_fault': 'OTFI_I1',
  'out_node': 'OTFI_D1',
  'xnor': 'OTFI_I2',
  'xor': 'OTFI_I2',
  'input_formula': 'OTFI_I1',
  'in_node': 'OTFI_I1',
  'output': 'OTFI_I1',
  'AND54': 'OTFI_A54',
  'AND43': 'OTFI_A43',
  'AND28': 'OTFI_A28',
  'AND19': 'OTFI_A19',
  'AND15': 'OTFI_A15',
  'AND12': 'OTFI_A12',
  'AND10': 'OTFI_A10',
  'AND9': 'OTFI_A9',
  'AND8': 'OTFI_A8',
  'AND7': 'OTFI_A7',
  'AND6': 'OTFI_A6',
  'AND5': 'OTFI_A5',
  'AND4': 'OTFI_A4',
  'AND3': 'OTFI_A3',
  'AND2': 'OTFI_A2',
  'OR40': 'OTFI_A40',
  'OR27': 'OTFI_A27',
  'OR10': 'OTFI_A10',
  'OR9': 'OTFI_A9',
  'OR8': 'OTFI_A8',
  'OR7': 'OTFI_A7',
  'OR6': 'OTFI_A6',
  'OR5': 'OTFI_A5',
  'OR4': 'OTFI_A4',
  'OR3': 'OTFI_A3',
  'OR2': 'OTFI_A2',
  'OR1': 'OTFI_A1'
}

in_type_pins = {
% for in_type, out_pins in cell_lib.type_mapping.in_type_pins.items():
  '${in_type}': ${out_pins},
% endfor
  'OTFI_D1': {'D', 'node_name'},
  'OTFI_I1': {'I1', 'node_name'},
  'OTFI_I2': {'I1', 'I2', 'node_name'},
  'OTFI_A1': {'A1', 'node_name'},
  'OTFI_A2': {'A1', 'A2', 'node_name'},
  'OTFI_A3': {'A1', 'A2', 'A3', 'node_name'},
  'OTFI_A4': {'A1', 'A2', 'A3', 'A4', 'node_name'},
  'OTFI_A5': {'A1', 'A2', 'A3', 'A4', 'A5', 'node_name'},
  'OTFI_A6': {'A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'node_name'},
  'OTFI_A7': {'A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'node_name'},
  'OTFI_A8': {'A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8', 'node_name'},
  'OTFI_A9': {'A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8', 'A9', 'node_name'},
  'OTFI_A10': {'A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8', 'A9', 'A10', 'node_name'},
  'OTFI_A12': {'A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8', 'A9', 'A10', 'A11', 'A12', 'node_name'},
  'OTFI_A15': {'A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8', 'A9', 'A10', 'A11', 'A12', 'A13', 'A14', 'A15', 'node_name'},
  'OTFI_A19': {'A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8', 'A9', 'A10', 'A11', 'A12', 'A13', 'A14', 'A15', 'A16', 'A17', 'A18', 'A19', 'node_name'},
  'OTFI_A27': {'A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8', 'A9', 'A10', 'A11', 'A12', 'A13', 'A14', 'A15', 'A16', 'A17', 'A18', 'A19', 'A20', 'A21', 'A22', 'A23', 'A24', 'A25', 'A26', 'A27', 'node_name'},
  'OTFI_A28': {'A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8', 'A9', 'A10', 'A11', 'A12', 'A13', 'A14', 'A15', 'A16', 'A17', 'A18', 'A19', 'A20', 'A21', 'A22', 'A23', 'A24', 'A25', 'A26', 'A27', 'A28', 'node_name'},
  'OTFI_A40': {'A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8', 'A9', 'A10', 'A11', 'A12', 'A13', 'A14', 'A15', 'A16', 'A17', 'A18', 'A19', 'A20', 'A21', 'A22', 'A23', 'A24', 'A25', 'A26', 'A27', 'A28', 'A29', 'A30', 'A31', 'A32', 'A33', 'A34', 'A35', 'A36', 'A37', 'A38', 'A39', 'A40', 'node_name'},
  'OTFI_A43': {'A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8', 'A9', 'A10', 'A11', 'A12', 'A13', 'A14', 'A15', 'A16', 'A17', 'A18', 'A19', 'A20', 'A21', 'A22', 'A23', 'A24', 'A25', 'A26', 'A27', 'A28', 'A29', 'A30', 'A31', 'A32', 'A33', 'A34', 'A35', 'A36', 'A37', 'A38', 'A39', 'A40', 'A41', 'A42', 'A43', 'node_name'},
  'OTFI_A54': {'A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8', 'A9', 'A10', 'A11', 'A12', 'A13', 'A14', 'A15', 'A16', 'A17', 'A18', 'A19', 'A20', 'A21', 'A22', 'A23', 'A24', 'A25', 'A26', 'A27', 'A28', 'A29', 'A30', 'A31', 'A32', 'A33', 'A34', 'A35', 'A36', 'A37', 'A38', 'A39', 'A40', 'A41', 'A42', 'A43', 'A44', 'A45', 'A46', 'A47', 'A48', 'A49', 'A50', 'A51', 'A52', 'A53', 'A54','node_name'},
}


gate_out_type = {
% for cell_name, out_type in cell_lib.type_mapping.gate_out_type.items():
  '${cell_name}': '${out_type}',
% endfor
  'prim_flop': 'OTFI_D1',
  'prim_flop_fault': 'OTFI_D1',
  'prim_buf': 'OTFI_I1',
  'prim_buf_fault': 'OTFI_I1',
  'input': 'OTFI_I1',
  'input_fault': 'OTFI_I1'
}

out_type_pins = {
% for out_type, out_pins in cell_lib.type_mapping.gate_out_type_pins.items():
  '${out_type}': ${out_pins},
% endfor
}


# The mapping from one input pin type to another used by the injector.
port_in_mapping = ${cell_lib.port_in_mapping}

# The mapping from one input pin type to another used by the injector.
port_out_mapping = ${cell_lib.port_out_mapping}

def rename_inputs(inputs: dict, type: str) -> dict:
    """ Rename the inputs for the current gate.

    As certain variables (e.g., "I", "S") are predefined by sympy, the cell lib
    generator renamed these pins for all gates in the cell library. Now, rename
    these pins also for the gates handed by the FI injector.

    Args:
        inputs: The list of provided inputs.
        type: The type of the gate.

    Returns:
        The renamed inputs for the gate.
    """
    filter_types = {"in_node", "out_node", "input", "output", "input_formula",
                    "xnor", "xor"}
    inputs_formated = {}
    for input, input_pin in inputs.items():
        if type not in filter_types:
            if "S" in input: input = input.replace("S", "K")
            if "I" in input: input = input.replace("I", "L")
        inputs_formated[input] = input_pin
    return inputs_formated

def validate_inputs(inputs: dict, graph: nx.DiGraph, type: str) -> dict:
    """ Validates the provided input of the gate.

    This function verifies that all inputs are present for the selected gate.

    Args:
        inputs: The list of provided inputs.
        graph: The networkx graph of the circuit.
        type: The type of the gate.

    Returns:
        The inputs for the gate.
    """
    type_pins = gate_in_type_out[type]
    expected_inputs = in_type_pins[type_pins]

    inputs = rename_inputs(inputs, type)

    if expected_inputs <= inputs.keys():
        input_symbols = {}
        for input_pin, input in inputs.items():
            input_symbols[input_pin] = input.name

        return input_symbols
    else:
        logger.error(inputs)
        raise Exception('Gate ' + type + ' is missing some inputs.')


def validate_generic_inputs(inputs: dict, num_inputs: int, type: str) -> dict:
    """ Validates the provided input of a generic gate.

    Generic gates, such as inputs, have generic input ports. Rename them to
    input + counter.

    Args:
        inputs: The list of provided inputs.
        num_inputs: The number of expected inputs.
        type: The type of the gate.

    Returns:
        The inputs for the generic gate.
    """
    if len(inputs) != num_inputs:
        logger.error(inputs)
        raise Exception('Gate ' + type + ' is missing some inputs.')
    input_symbols = {}
    in_count = 0
    for input_pin, input in inputs.items():
        if input_pin == "node_name":
            input_symbols[input_pin] = input.name
        else:
            input_symbols["input_" + str(in_count)] = input.name
            in_count += 1
    return input_symbols

% for cell_function in cell_lib.cell_formulas:
def ${cell_function.name}(inputs: dict, graph: nx.DiGraph, solver):
    ''' ${cell_function.name} gate.

    Args:
        inputs: ${cell_function.inputs}
        graph: The networkx graph of the circuit.
        solver: The SAT solver instance.

    Returns:
        ${cell_function.output} = ${cell_function.function}
    '''
    p = validate_inputs(inputs, graph, '${cell_function.name}')
    % for clause in cell_function.clauses:
    solver.add_clause(${clause})
    % endfor

% endfor

################################################################################
#                      OTFI SPECIFC CELLS - DO NOT EDIT                        # 
################################################################################
def xnor(inputs: dict, graph: nx.DiGraph, solver):
    """ xnor gate.

    Args:
        inputs: {'input_0', 'input_1', 'node_name'}.
        graph: The networkx graph of the circuit.
        solver: The SAT solver instance.

    Returns:
        ZN = '!(input_0 ^ input_1)'.
    """
    p = validate_generic_inputs(inputs, 3, 'xnor')
    solver.add_clause([-p['input_0'], -p['input_1'], p['node_name']])
    solver.add_clause([p['input_0'], p['input_1'], p['node_name']])
    solver.add_clause([p['input_0'], -p['input_1'], -p['node_name']])
    solver.add_clause([-p['input_0'], p['input_1'], -p['node_name']])


def xor(inputs: dict, graph: nx.DiGraph, solver):
    """ xor gate.

    Args:
        inputs: {'input_0', 'input_1', 'node_name'}.
        graph: The networkx graph of the circuit.

    Returns:
        ZN = '(input_0 ^ input_1)'.
    """
    p = validate_generic_inputs(inputs, 3, 'xor')
    solver.add_clause([-p['input_0'], -p['input_1'], -p['node_name']])
    solver.add_clause([p['input_0'], p['input_1'], -p['node_name']])
    solver.add_clause([p['input_0'], -p['input_1'], p['node_name']])
    solver.add_clause([-p['input_0'], p['input_1'], p['node_name']])

def and_output(inputs: dict, graph: nx.DiGraph, solver):
    """ and gate.

    AND gate for the output logic. As this is the last element of the formula
    the expression '& node_name' is added.

    Args:
        inputs: {'A1', ..., 'AN', 'node_name'}.
        graph: The networkx graph of the circuit.

    Returns:
        ZN = 'A1 & ... & AN' & node_name.
    """
    if len(inputs) == 3:
        p = validate_inputs(inputs, graph, 'AND2')
        solver.add_clause([p['A1'], -p['node_name']])
        solver.add_clause([p['A2'], -p['node_name']])
        solver.add_clause([p['node_name'], -p['A1'], -p['A2']])
        solver.add_clause([p['node_name']])
    elif len(inputs) == 4:
        p = validate_inputs(inputs, graph, 'AND3')
        solver.add_clause([p['A1'], -p['node_name']])
        solver.add_clause([p['A2'], -p['node_name']])
        solver.add_clause([p['A3'], -p['node_name']])
        solver.add_clause([p['node_name'], -p['A1'], -p['A2'], -p['A3']])
        solver.add_clause([p['node_name']])
    elif len(inputs) == 5:
        p = validate_inputs(inputs, graph, 'AND4')
        solver.add_clause([p['A1'], -p['node_name']])
        solver.add_clause([p['A2'], -p['node_name']])
        solver.add_clause([p['A3'], -p['node_name']])
        solver.add_clause([p['A4'], -p['node_name']])
        solver.add_clause(
            [p['node_name'], -p['A1'], -p['A2'], -p['A3'], -p['A4']])
        solver.add_clause([p['node_name']])
    elif len(inputs) == 6:
        p = validate_inputs(inputs, graph, 'AND5')
        solver.add_clause([p['A1'], -p['node_name']])
        solver.add_clause([p['A2'], -p['node_name']])
        solver.add_clause([p['A3'], -p['node_name']])
        solver.add_clause([p['A4'], -p['node_name']])
        solver.add_clause([p['A5'], -p['node_name']])
        solver.add_clause(
            [p['node_name'], -p['A1'], -p['A2'], -p['A3'], -p['A4'], -p['A5']])
        solver.add_clause([p['node_name']])
    elif len(inputs) == 7:
        p = validate_inputs(inputs, graph, 'AND6')
        solver.add_clause([p['A1'], -p['node_name']])
        solver.add_clause([p['A2'], -p['node_name']])
        solver.add_clause([p['A3'], -p['node_name']])
        solver.add_clause([p['A4'], -p['node_name']])
        solver.add_clause([p['A5'], -p['node_name']])
        solver.add_clause([p['A6'], -p['node_name']])
        solver.add_clause([
            p['node_name'], -p['A1'], -p['A2'], -p['A3'], -p['A4'], -p['A5'],
            -p['A6']
        ])
        solver.add_clause([p['node_name']])
    elif len(inputs) == 8:
        p = validate_inputs(inputs, graph, 'AND7')
        solver.add_clause([p['A1'], -p['node_name']])
        solver.add_clause([p['A2'], -p['node_name']])
        solver.add_clause([p['A3'], -p['node_name']])
        solver.add_clause([p['A4'], -p['node_name']])
        solver.add_clause([p['A5'], -p['node_name']])
        solver.add_clause([p['A6'], -p['node_name']])
        solver.add_clause([p['A7'], -p['node_name']])
        solver.add_clause([
            p['node_name'], -p['A1'], -p['A2'], -p['A3'], -p['A4'], -p['A5'],
            -p['A6'], -p['A7']
        ])
        solver.add_clause([p['node_name']])
    elif len(inputs) == 9:
        p = validate_inputs(inputs, graph, 'AND8')
        solver.add_clause([p['A1'], -p['node_name']])
        solver.add_clause([p['A2'], -p['node_name']])
        solver.add_clause([p['A3'], -p['node_name']])
        solver.add_clause([p['A4'], -p['node_name']])
        solver.add_clause([p['A5'], -p['node_name']])
        solver.add_clause([p['A6'], -p['node_name']])
        solver.add_clause([p['A7'], -p['node_name']])
        solver.add_clause([p['A8'], -p['node_name']])
        solver.add_clause([
            p['node_name'], -p['A1'], -p['A2'], -p['A3'], -p['A4'], -p['A5'],
            -p['A6'], -p['A7'], -p['A8']
        ])
        solver.add_clause([p['node_name']])
    elif len(inputs) == 10:
        p = validate_inputs(inputs, graph, 'AND9')
        solver.add_clause([p['A1'], -p['node_name']])
        solver.add_clause([p['A2'], -p['node_name']])
        solver.add_clause([p['A3'], -p['node_name']])
        solver.add_clause([p['A4'], -p['node_name']])
        solver.add_clause([p['A5'], -p['node_name']])
        solver.add_clause([p['A6'], -p['node_name']])
        solver.add_clause([p['A7'], -p['node_name']])
        solver.add_clause([p['A8'], -p['node_name']])
        solver.add_clause([p['A9'], -p['node_name']])
        solver.add_clause([
            p['node_name'], -p['A1'], -p['A2'], -p['A3'], -p['A4'], -p['A5'],
            -p['A6'], -p['A7'], -p['A8'], -p['A9']
        ])
        solver.add_clause([p['node_name']])
    elif len(inputs) == 11:
        p = validate_inputs(inputs, graph, 'AND10')
        solver.add_clause([p['A1'], -p['node_name']])
        solver.add_clause([p['A2'], -p['node_name']])
        solver.add_clause([p['A3'], -p['node_name']])
        solver.add_clause([p['A4'], -p['node_name']])
        solver.add_clause([p['A5'], -p['node_name']])
        solver.add_clause([p['A6'], -p['node_name']])
        solver.add_clause([p['A7'], -p['node_name']])
        solver.add_clause([p['A8'], -p['node_name']])
        solver.add_clause([p['A9'], -p['node_name']])
        solver.add_clause([p['A10'], -p['node_name']])
        solver.add_clause([
            p['node_name'], -p['A1'], -p['A2'], -p['A3'], -p['A4'], -p['A5'],
            -p['A6'], -p['A7'], -p['A8'], -p['A9'], -p['A10']
        ])
        solver.add_clause([p['node_name']])
    elif len(inputs) == 13:
        p = validate_inputs(inputs, graph, 'AND12')
        solver.add_clause([p['A1'], -p['node_name']])
        solver.add_clause([p['A2'], -p['node_name']])
        solver.add_clause([p['A3'], -p['node_name']])
        solver.add_clause([p['A4'], -p['node_name']])
        solver.add_clause([p['A5'], -p['node_name']])
        solver.add_clause([p['A6'], -p['node_name']])
        solver.add_clause([p['A7'], -p['node_name']])
        solver.add_clause([p['A8'], -p['node_name']])
        solver.add_clause([p['A9'], -p['node_name']])
        solver.add_clause([p['A10'], -p['node_name']])
        solver.add_clause([p['A11'], -p['node_name']])
        solver.add_clause([p['A12'], -p['node_name']])
        solver.add_clause([p['node_name'], -p['A1'], -p['A2'], -p['A3'], -p['A4'], -p['A5'], -p['A6'], -p['A7'], -p['A8'], -p['A9'], -p['A10'], -p['A11'], -p['A12']])
        solver.add_clause([p['node_name']])
    elif len(inputs) == 16:
        p = validate_inputs(inputs, graph, 'AND15')
        solver.add_clause([p['A1'], -p['node_name']])
        solver.add_clause([p['A2'], -p['node_name']])
        solver.add_clause([p['A3'], -p['node_name']])
        solver.add_clause([p['A4'], -p['node_name']])
        solver.add_clause([p['A5'], -p['node_name']])
        solver.add_clause([p['A6'], -p['node_name']])
        solver.add_clause([p['A7'], -p['node_name']])
        solver.add_clause([p['A8'], -p['node_name']])
        solver.add_clause([p['A9'], -p['node_name']])
        solver.add_clause([p['A10'], -p['node_name']])
        solver.add_clause([p['A11'], -p['node_name']])
        solver.add_clause([p['A12'], -p['node_name']])
        solver.add_clause([p['A13'], -p['node_name']])
        solver.add_clause([p['A14'], -p['node_name']])
        solver.add_clause([p['A15'], -p['node_name']])
        solver.add_clause([
            p['node_name'], -p['A1'], -p['A2'], -p['A3'], -p['A4'], -p['A5'],
            -p['A6'], -p['A7'], -p['A8'], -p['A9'], -p['A10'], -p['A11'],
            -p['A12'], -p['A13'], -p['A14'], -p['A15']
        ])
        solver.add_clause([p['node_name']])
    elif len(inputs) == 20:
        p = validate_inputs(inputs, graph, 'AND19')
        solver.add_clause([p['A1'], -p['node_name']])
        solver.add_clause([p['A2'], -p['node_name']])
        solver.add_clause([p['A3'], -p['node_name']])
        solver.add_clause([p['A4'], -p['node_name']])
        solver.add_clause([p['A5'], -p['node_name']])
        solver.add_clause([p['A6'], -p['node_name']])
        solver.add_clause([p['A7'], -p['node_name']])
        solver.add_clause([p['A8'], -p['node_name']])
        solver.add_clause([p['A9'], -p['node_name']])
        solver.add_clause([p['A10'], -p['node_name']])
        solver.add_clause([p['A11'], -p['node_name']])
        solver.add_clause([p['A12'], -p['node_name']])
        solver.add_clause([p['A13'], -p['node_name']])
        solver.add_clause([p['A14'], -p['node_name']])
        solver.add_clause([p['A15'], -p['node_name']])
        solver.add_clause([p['A16'], -p['node_name']])
        solver.add_clause([p['A17'], -p['node_name']])
        solver.add_clause([p['A18'], -p['node_name']])
        solver.add_clause([p['A19'], -p['node_name']])
        solver.add_clause([
            p['node_name'], -p['A1'], -p['A2'], -p['A3'], -p['A4'], -p['A5'],
            -p['A6'], -p['A7'], -p['A8'], -p['A9'], -p['A10'], -p['A11'],
            -p['A12'], -p['A13'], -p['A14'], -p['A15'], -p['A16'], -p['A17'],
            -p['A18'], -p['A19']
        ])
        solver.add_clause([p['node_name']])
    elif len(inputs) == 29:
        p = validate_inputs(inputs, graph, 'AND28')
        solver.add_clause([p['A1'], -p['node_name']])
        solver.add_clause([p['A2'], -p['node_name']])
        solver.add_clause([p['A3'], -p['node_name']])
        solver.add_clause([p['A4'], -p['node_name']])
        solver.add_clause([p['A5'], -p['node_name']])
        solver.add_clause([p['A6'], -p['node_name']])
        solver.add_clause([p['A7'], -p['node_name']])
        solver.add_clause([p['A8'], -p['node_name']])
        solver.add_clause([p['A9'], -p['node_name']])
        solver.add_clause([p['A10'], -p['node_name']])
        solver.add_clause([p['A11'], -p['node_name']])
        solver.add_clause([p['A12'], -p['node_name']])
        solver.add_clause([p['A13'], -p['node_name']])
        solver.add_clause([p['A14'], -p['node_name']])
        solver.add_clause([p['A15'], -p['node_name']])
        solver.add_clause([p['A16'], -p['node_name']])
        solver.add_clause([p['A17'], -p['node_name']])
        solver.add_clause([p['A18'], -p['node_name']])
        solver.add_clause([p['A19'], -p['node_name']])
        solver.add_clause([p['A20'], -p['node_name']])
        solver.add_clause([p['A21'], -p['node_name']])
        solver.add_clause([p['A22'], -p['node_name']])
        solver.add_clause([p['A23'], -p['node_name']])
        solver.add_clause([p['A24'], -p['node_name']])
        solver.add_clause([p['A25'], -p['node_name']])
        solver.add_clause([p['A26'], -p['node_name']])
        solver.add_clause([p['A27'], -p['node_name']])
        solver.add_clause([p['A28'], -p['node_name']])

        solver.add_clause([
            p['node_name'], -p['A1'], -p['A2'], -p['A3'], -p['A4'], -p['A5'],
            -p['A6'], -p['A7'], -p['A8'], -p['A9'], -p['A10'], -p['A11'],
            -p['A12'], -p['A13'], -p['A14'], -p['A15'], -p['A16'], -p['A17'],
            -p['A18'], -p['A19'], -p['A20'], -p['A21'], -p['A22'], -p['A23'], -p['A24'], -p['A25'], -p['A26'], -p['A27'], -p['A28']
        ])
        solver.add_clause([p['node_name']])
    elif len(inputs) == 44:
        p = validate_inputs(inputs, graph, 'AND43')
        solver.add_clause([p['A1'], -p['node_name']])
        solver.add_clause([p['A2'], -p['node_name']])
        solver.add_clause([p['A3'], -p['node_name']])
        solver.add_clause([p['A4'], -p['node_name']])
        solver.add_clause([p['A5'], -p['node_name']])
        solver.add_clause([p['A6'], -p['node_name']])
        solver.add_clause([p['A7'], -p['node_name']])
        solver.add_clause([p['A8'], -p['node_name']])
        solver.add_clause([p['A9'], -p['node_name']])
        solver.add_clause([p['A10'], -p['node_name']])
        solver.add_clause([p['A11'], -p['node_name']])
        solver.add_clause([p['A12'], -p['node_name']])
        solver.add_clause([p['A13'], -p['node_name']])
        solver.add_clause([p['A14'], -p['node_name']])
        solver.add_clause([p['A15'], -p['node_name']])
        solver.add_clause([p['A16'], -p['node_name']])
        solver.add_clause([p['A17'], -p['node_name']])
        solver.add_clause([p['A18'], -p['node_name']])
        solver.add_clause([p['A19'], -p['node_name']])
        solver.add_clause([p['A20'], -p['node_name']])
        solver.add_clause([p['A21'], -p['node_name']])
        solver.add_clause([p['A22'], -p['node_name']])
        solver.add_clause([p['A23'], -p['node_name']])
        solver.add_clause([p['A24'], -p['node_name']])
        solver.add_clause([p['A25'], -p['node_name']])
        solver.add_clause([p['A26'], -p['node_name']])
        solver.add_clause([p['A27'], -p['node_name']])
        solver.add_clause([p['A28'], -p['node_name']])
        solver.add_clause([p['A29'], -p['node_name']])
        solver.add_clause([p['A30'], -p['node_name']])
        solver.add_clause([p['A31'], -p['node_name']])
        solver.add_clause([p['A32'], -p['node_name']])
        solver.add_clause([p['A33'], -p['node_name']])
        solver.add_clause([p['A34'], -p['node_name']])
        solver.add_clause([p['A35'], -p['node_name']])
        solver.add_clause([p['A36'], -p['node_name']])
        solver.add_clause([p['A37'], -p['node_name']])
        solver.add_clause([p['A38'], -p['node_name']])
        solver.add_clause([p['A39'], -p['node_name']])
        solver.add_clause([p['A40'], -p['node_name']])
        solver.add_clause([p['A41'], -p['node_name']])
        solver.add_clause([p['A42'], -p['node_name']])
        solver.add_clause([p['A43'], -p['node_name']])

        solver.add_clause([
            p['node_name'], -p['A1'], -p['A2'], -p['A3'], -p['A4'], -p['A5'],
            -p['A6'], -p['A7'], -p['A8'], -p['A9'], -p['A10'], -p['A11'],
            -p['A12'], -p['A13'], -p['A14'], -p['A15'], -p['A16'], -p['A17'],
            -p['A18'], -p['A19'], -p['A20'], -p['A21'], -p['A22'], -p['A23'], -p['A24'], -p['A25'], -p['A26'], -p['A27'], -p['A28'],
            -p['A29'], -p['A30'], -p['A31'], -p['A32'], -p['A33'], -p['A34'], -p['A35'], -p['A36'], -p['A37'], -p['A38'], -p['A39'],
            -p['A40'], -p['A41'], -p['A42'], -p['A43']
        ])
        solver.add_clause([p['node_name']])
    elif len(inputs) == 55:
        p = validate_inputs(inputs, graph, 'AND54')
        solver.add_clause([p['A1'], -p['node_name']])
        solver.add_clause([p['A2'], -p['node_name']])
        solver.add_clause([p['A3'], -p['node_name']])
        solver.add_clause([p['A4'], -p['node_name']])
        solver.add_clause([p['A5'], -p['node_name']])
        solver.add_clause([p['A6'], -p['node_name']])
        solver.add_clause([p['A7'], -p['node_name']])
        solver.add_clause([p['A8'], -p['node_name']])
        solver.add_clause([p['A9'], -p['node_name']])
        solver.add_clause([p['A10'], -p['node_name']])
        solver.add_clause([p['A11'], -p['node_name']])
        solver.add_clause([p['A12'], -p['node_name']])
        solver.add_clause([p['A13'], -p['node_name']])
        solver.add_clause([p['A14'], -p['node_name']])
        solver.add_clause([p['A15'], -p['node_name']])
        solver.add_clause([p['A16'], -p['node_name']])
        solver.add_clause([p['A17'], -p['node_name']])
        solver.add_clause([p['A18'], -p['node_name']])
        solver.add_clause([p['A19'], -p['node_name']])
        solver.add_clause([p['A20'], -p['node_name']])
        solver.add_clause([p['A21'], -p['node_name']])
        solver.add_clause([p['A22'], -p['node_name']])
        solver.add_clause([p['A23'], -p['node_name']])
        solver.add_clause([p['A24'], -p['node_name']])
        solver.add_clause([p['A25'], -p['node_name']])
        solver.add_clause([p['A26'], -p['node_name']])
        solver.add_clause([p['A27'], -p['node_name']])
        solver.add_clause([p['A28'], -p['node_name']])
        solver.add_clause([p['A29'], -p['node_name']])
        solver.add_clause([p['A30'], -p['node_name']])
        solver.add_clause([p['A31'], -p['node_name']])
        solver.add_clause([p['A32'], -p['node_name']])
        solver.add_clause([p['A33'], -p['node_name']])
        solver.add_clause([p['A34'], -p['node_name']])
        solver.add_clause([p['A35'], -p['node_name']])
        solver.add_clause([p['A36'], -p['node_name']])
        solver.add_clause([p['A37'], -p['node_name']])
        solver.add_clause([p['A38'], -p['node_name']])
        solver.add_clause([p['A39'], -p['node_name']])
        solver.add_clause([p['A40'], -p['node_name']])
        solver.add_clause([p['A41'], -p['node_name']])
        solver.add_clause([p['A42'], -p['node_name']])
        solver.add_clause([p['A43'], -p['node_name']])
        solver.add_clause([p['A44'], -p['node_name']])
        solver.add_clause([p['A45'], -p['node_name']])
        solver.add_clause([p['A46'], -p['node_name']])
        solver.add_clause([p['A47'], -p['node_name']])
        solver.add_clause([p['A48'], -p['node_name']])
        solver.add_clause([p['A49'], -p['node_name']])
        solver.add_clause([p['A50'], -p['node_name']])
        solver.add_clause([p['A51'], -p['node_name']])
        solver.add_clause([p['A52'], -p['node_name']])
        solver.add_clause([p['A53'], -p['node_name']])
        solver.add_clause([p['A54'], -p['node_name']])

        solver.add_clause([
            p['node_name'], -p['A1'], -p['A2'], -p['A3'], -p['A4'], -p['A5'],
            -p['A6'], -p['A7'], -p['A8'], -p['A9'], -p['A10'], -p['A11'],
            -p['A12'], -p['A13'], -p['A14'], -p['A15'], -p['A16'], -p['A17'],
            -p['A18'], -p['A19'], -p['A20'], -p['A21'], -p['A22'], -p['A23'], -p['A24'], -p['A25'], -p['A26'], -p['A27'], -p['A28'],
            -p['A29'], -p['A30'], -p['A31'], -p['A32'], -p['A33'], -p['A34'], -p['A35'], -p['A36'], -p['A37'], -p['A38'], -p['A39'],
            -p['A40'], -p['A41'], -p['A42'], -p['A43'], -p['A44'], -p['A45'], -p['A46'], -p['A47'], -p['A48'], -p['A49'], -p['A50'],
            -p['A51'], -p['A52'], -p['A53'], -p['A54']
        ])
        solver.add_clause([p['node_name']])
    else:
        print(len(inputs))
        raise Exception('Missing and gate for output logic.')


def or_output(inputs: dict, graph: nx.DiGraph, solver):
    """ or gate.

    OR gate for the output logic.

    Args:
        inputs: {'A1', ..., 'AN', 'node_name'}.
        graph: The networkx graph of the circuit.

    Returns:
        ZN = 'A1 | ... | AN' | node_name.
    """
    if len(inputs) == 2:
        p = validate_inputs(inputs, graph, 'OR1')
        solver.add_clause([-p["A1"], p["node_name"]])
        solver.add_clause([p["A1"], -p["node_name"]])
    elif len(inputs) == 3:
        p = validate_inputs(inputs, graph, 'OR2')
        solver.add_clause([-p["A1"], p["node_name"]])
        solver.add_clause([-p["A2"], p["node_name"]])
        solver.add_clause([p["A1"], p["A2"], -p["node_name"]])
    elif len(inputs) == 4:
        p = validate_inputs(inputs, graph, 'OR3')
        solver.add_clause([-p["A1"], p["node_name"]])
        solver.add_clause([-p["A2"], p["node_name"]])
        solver.add_clause([-p["A3"], p["node_name"]])
        solver.add_clause([p["A1"], p["A2"], p["A3"], -p["node_name"]])
    elif len(inputs) == 5:
        p = validate_inputs(inputs, graph, 'OR4')
        solver.add_clause([-p["A1"], p["node_name"]])
        solver.add_clause([-p["A2"], p["node_name"]])
        solver.add_clause([-p["A3"], p["node_name"]])
        solver.add_clause([-p["A4"], p["node_name"]])
        solver.add_clause(
            [p["A1"], p["A2"], p["A3"], p["A4"], -p["node_name"]])
    elif len(inputs) == 6:
        p = validate_inputs(inputs, graph, 'OR5')
        solver.add_clause([-p["A1"], p["node_name"]])
        solver.add_clause([-p["A2"], p["node_name"]])
        solver.add_clause([-p["A3"], p["node_name"]])
        solver.add_clause([-p["A4"], p["node_name"]])
        solver.add_clause([-p["A5"], p["node_name"]])
        solver.add_clause(
            [p["A1"], p["A2"], p["A3"], p["A4"], p["A5"], -p["node_name"]])
    elif len(inputs) == 7:
        p = validate_inputs(inputs, graph, 'OR6')
        solver.add_clause([-p["A1"], p["node_name"]])
        solver.add_clause([-p["A2"], p["node_name"]])
        solver.add_clause([-p["A3"], p["node_name"]])
        solver.add_clause([-p["A4"], p["node_name"]])
        solver.add_clause([-p["A5"], p["node_name"]])
        solver.add_clause([-p["A6"], p["node_name"]])
        solver.add_clause([
            p["A1"], p["A2"], p["A3"], p["A4"], p["A5"], p["A6"],
            -p["node_name"]
        ])
    elif len(inputs) == 8:
        p = validate_inputs(inputs, graph, 'OR7')
        solver.add_clause([-p["A1"], p["node_name"]])
        solver.add_clause([-p["A2"], p["node_name"]])
        solver.add_clause([-p["A3"], p["node_name"]])
        solver.add_clause([-p["A4"], p["node_name"]])
        solver.add_clause([-p["A5"], p["node_name"]])
        solver.add_clause([-p["A6"], p["node_name"]])
        solver.add_clause([-p["A7"], p["node_name"]])
        solver.add_clause([
            p["A1"], p["A2"], p["A3"], p["A4"], p["A5"], p["A6"], p["A7"],
            -p["node_name"]
        ])
    elif len(inputs) == 9:
        p = validate_inputs(inputs, graph, 'OR8')
        solver.add_clause([-p["A1"], p["node_name"]])
        solver.add_clause([-p["A2"], p["node_name"]])
        solver.add_clause([-p["A3"], p["node_name"]])
        solver.add_clause([-p["A4"], p["node_name"]])
        solver.add_clause([-p["A5"], p["node_name"]])
        solver.add_clause([-p["A6"], p["node_name"]])
        solver.add_clause([-p["A7"], p["node_name"]])
        solver.add_clause([-p["A8"], p["node_name"]])
        solver.add_clause([
            p["A1"], p["A2"], p["A3"], p["A4"], p["A5"], p["A6"], p["A7"],
            p["A8"], -p["node_name"]
        ])
    elif len(inputs) == 10:
        p = validate_inputs(inputs, graph, 'OR9')
        solver.add_clause([-p["A1"], p["node_name"]])
        solver.add_clause([-p["A2"], p["node_name"]])
        solver.add_clause([-p["A3"], p["node_name"]])
        solver.add_clause([-p["A4"], p["node_name"]])
        solver.add_clause([-p["A5"], p["node_name"]])
        solver.add_clause([-p["A6"], p["node_name"]])
        solver.add_clause([-p["A7"], p["node_name"]])
        solver.add_clause([-p["A8"], p["node_name"]])
        solver.add_clause([-p["A9"], p["node_name"]])
        solver.add_clause([
            p["A1"], p["A2"], p["A3"], p["A4"], p["A5"], p["A6"], p["A7"],
            p["A8"], p["A9"], -p["node_name"]
        ])
    elif len(inputs) == 11:
        p = validate_inputs(inputs, graph, 'OR10')
        solver.add_clause([-p["A1"], p["node_name"]])
        solver.add_clause([-p["A2"], p["node_name"]])
        solver.add_clause([-p["A3"], p["node_name"]])
        solver.add_clause([-p["A4"], p["node_name"]])
        solver.add_clause([-p["A5"], p["node_name"]])
        solver.add_clause([-p["A6"], p["node_name"]])
        solver.add_clause([-p["A7"], p["node_name"]])
        solver.add_clause([-p["A8"], p["node_name"]])
        solver.add_clause([-p["A9"], p["node_name"]])
        solver.add_clause([-p["A10"], p["node_name"]])
        solver.add_clause([
            p["A1"], p["A2"], p["A3"], p["A4"], p["A5"], p["A6"], p["A7"],
            p["A8"], p["A9"], p["A10"], -p["node_name"]
        ])
    elif len(inputs) == 28:
        p = validate_inputs(inputs, graph, 'OR27')
        solver.add_clause([-p["A1"], p["node_name"]])
        solver.add_clause([-p["A2"], p["node_name"]])
        solver.add_clause([-p["A3"], p["node_name"]])
        solver.add_clause([-p["A4"], p["node_name"]])
        solver.add_clause([-p["A5"], p["node_name"]])
        solver.add_clause([-p["A6"], p["node_name"]])
        solver.add_clause([-p["A7"], p["node_name"]])
        solver.add_clause([-p["A8"], p["node_name"]])
        solver.add_clause([-p["A9"], p["node_name"]])
        solver.add_clause([-p["A10"], p["node_name"]])
        solver.add_clause([-p["A11"], p["node_name"]])
        solver.add_clause([-p["A12"], p["node_name"]])
        solver.add_clause([-p["A13"], p["node_name"]])
        solver.add_clause([-p["A14"], p["node_name"]])
        solver.add_clause([-p["A15"], p["node_name"]])
        solver.add_clause([-p["A16"], p["node_name"]])
        solver.add_clause([-p["A17"], p["node_name"]])
        solver.add_clause([-p["A18"], p["node_name"]])
        solver.add_clause([-p["A19"], p["node_name"]])
        solver.add_clause([-p["A20"], p["node_name"]])
        solver.add_clause([-p["A21"], p["node_name"]])
        solver.add_clause([-p["A22"], p["node_name"]])
        solver.add_clause([-p["A23"], p["node_name"]])
        solver.add_clause([-p["A24"], p["node_name"]])
        solver.add_clause([-p["A25"], p["node_name"]])
        solver.add_clause([-p["A26"], p["node_name"]])
        solver.add_clause([-p["A27"], p["node_name"]])
        solver.add_clause([
            p["A1"], p["A2"], p["A3"], p["A4"], p["A5"], p["A6"], p["A7"],
            p["A8"], p["A9"], p["A10"], p["A11"], p["A12"], p["A13"], p["A14"], p["A15"], p["A16"], p["A17"], 
            p["A18"], p["A19"], p["A20"], p["A21"], p["A22"], p["A23"], p["A24"], p["A25"], p["A26"], p["A27"], -p["node_name"]
        ])
    elif len(inputs) == 41:
        p = validate_inputs(inputs, graph, 'OR40')
        solver.add_clause([-p["A1"], p["node_name"]])
        solver.add_clause([-p["A2"], p["node_name"]])
        solver.add_clause([-p["A3"], p["node_name"]])
        solver.add_clause([-p["A4"], p["node_name"]])
        solver.add_clause([-p["A5"], p["node_name"]])
        solver.add_clause([-p["A6"], p["node_name"]])
        solver.add_clause([-p["A7"], p["node_name"]])
        solver.add_clause([-p["A8"], p["node_name"]])
        solver.add_clause([-p["A9"], p["node_name"]])
        solver.add_clause([-p["A10"], p["node_name"]])
        solver.add_clause([-p["A11"], p["node_name"]])
        solver.add_clause([-p["A12"], p["node_name"]])
        solver.add_clause([-p["A13"], p["node_name"]])
        solver.add_clause([-p["A14"], p["node_name"]])
        solver.add_clause([-p["A15"], p["node_name"]])
        solver.add_clause([-p["A16"], p["node_name"]])
        solver.add_clause([-p["A17"], p["node_name"]])
        solver.add_clause([-p["A18"], p["node_name"]])
        solver.add_clause([-p["A19"], p["node_name"]])
        solver.add_clause([-p["A20"], p["node_name"]])
        solver.add_clause([-p["A21"], p["node_name"]])
        solver.add_clause([-p["A22"], p["node_name"]])
        solver.add_clause([-p["A23"], p["node_name"]])
        solver.add_clause([-p["A24"], p["node_name"]])
        solver.add_clause([-p["A25"], p["node_name"]])
        solver.add_clause([-p["A26"], p["node_name"]])
        solver.add_clause([-p["A27"], p["node_name"]])
        solver.add_clause([-p["A28"], p["node_name"]])
        solver.add_clause([-p["A29"], p["node_name"]])
        solver.add_clause([-p["A30"], p["node_name"]])
        solver.add_clause([-p["A31"], p["node_name"]])
        solver.add_clause([-p["A32"], p["node_name"]])
        solver.add_clause([-p["A33"], p["node_name"]])
        solver.add_clause([-p["A34"], p["node_name"]])
        solver.add_clause([-p["A35"], p["node_name"]])
        solver.add_clause([-p["A36"], p["node_name"]])
        solver.add_clause([-p["A37"], p["node_name"]])
        solver.add_clause([-p["A38"], p["node_name"]])
        solver.add_clause([-p["A39"], p["node_name"]])
        solver.add_clause([-p["A40"], p["node_name"]])
        solver.add_clause([
            p["A1"], p["A2"], p["A3"], p["A4"], p["A5"], p["A6"], p["A7"],
            p["A8"], p["A9"], p["A10"], p["A11"], p["A12"], p["A13"], p["A14"], p["A15"], p["A16"], p["A17"], 
            p["A18"], p["A19"], p["A20"], p["A21"], p["A22"], p["A23"], p["A24"], p["A25"], p["A26"], p["A27"],
            p["A28"], p["A29"], p["A30"], p["A31"], p["A32"], p["A33"], p["A34"], p["A35"], p["A36"], p["A37"], 
            p["A38"], p["A39"], p["A40"], -p["node_name"]
        ])
    else:
        raise Exception('Missing or gate for output logic.')

def input_formula_Q(inputs: dict, graph: nx.DiGraph, solver):
    """ Sets a input pin to a predefined (0 or 1) value.

    Args:
        inputs: {'input_0', 'node_name'}.
        graph: The networkx graph of the circuit.

    Returns:
        0 or 1.
    """
    p = validate_generic_inputs(inputs, 2, "input_formula_Q")

    if one == p['input_0']:
        # Input is connected to 1.
        # Return a one.
        solver.add_clause([-one, p['node_name']])
        solver.add_clause([one, -p['node_name']])
    else:
        # Input ist connected to 0.
        # Return a zero.
        solver.add_clause([-zero, p['node_name']])
        solver.add_clause([zero, -p['node_name']])


def input_formula_QN(inputs: dict, graph: nx.DiGraph, solver):
    """ Sets a input pin to a predefined (0 or 1) value.

    Args:
        inputs: {'input_0', 'node_name'}.
        graph: The networkx graph of the circuit.

    Returns:
        0 or 1.
    """
    p = validate_generic_inputs(inputs, 2, "input_formula_QN")

    if one == p['input_0']:
        # Input is connected to 1.
        # Return a zero.
        solver.add_clause([-zero, p['node_name']])
        solver.add_clause([zero, -p['node_name']])
    else:
        # Input ist connected to 0.
        # Return a one.
        solver.add_clause([-one, p['node_name']])
        solver.add_clause([one, -p['node_name']])


def in_node_Q(inputs: dict, graph: nx.DiGraph, solver):
    """ In node Q

    Args:
        inputs: {'input_0', 'node_name'}.
        graph: The networkx graph of the circuit.

    Returns:
        Q = input_0
    """
    p = validate_generic_inputs(inputs, 2, "in_node_Q")
    solver.add_clause([-p['input_0'], p['node_name']])
    solver.add_clause([p['input_0'], -p['node_name']])


def in_node_QN(inputs: dict, graph: nx.DiGraph, solver):
    """ In node QN

    Args:
        inputs: {'input_0', 'node_name'}.
        graph: The networkx graph of the circuit.

    Returns:
        Q = !input_0
    """
    p = validate_generic_inputs(inputs, 2, "in_node_QN")
    solver.add_clause([-p['I1'], -p['node_name']])
    solver.add_clause([p['I1'], p['node_name']])


def out_node(inputs: dict, graph: nx.DiGraph, solver):
    """ Out node.

    Args:
        inputs: {'input_0', 'node_name'}.
        graph: The networkx graph of the circuit.

    Returns:
        ZN = input_0.
    """
    p = validate_generic_inputs(inputs, 2, "out_node")
    solver.add_clause([-p['input_0'], p['node_name']])
    solver.add_clause([p['input_0'], -p['node_name']])

def prim_buf(inputs: dict, graph: nx.DiGraph, solver):
    """ Prim buf node.

    Args:
        inputs: {'input_0', 'node_name'}.
        graph: The networkx graph of the circuit.

    Returns:
        ZN = input_0.
    """
    p = validate_generic_inputs(inputs, 2, "prim_buf")
    solver.add_clause([-p['input_0'], p['node_name']])
    solver.add_clause([p['input_0'], -p['node_name']])

def prim_buf_inv(inputs: dict, graph: nx.DiGraph, solver):
    """ Prim buf node.

    Args:
        inputs: {'input_0', 'node_name'}.
        graph: The networkx graph of the circuit.

    Returns:
        ZN = !input_0.
    """
    p = validate_generic_inputs(inputs, 2, "prim_buf")
    solver.add_clause([-p['input_0'], -p['node_name']])
    solver.add_clause([p['input_0'], p['node_name']])

def prim_flop(inputs: dict, graph: nx.DiGraph, solver):
    """ Register.

    Args:
        inputs: {'d_i/D', 'node_name'}.
        graph: The networkx graph of the circuit.

    Returns:
        Q = d_i/D.
    """
    if "d_i" in inputs:
        solver.add_clause([-inputs['d_i'].name, inputs['node_name'].name])
        solver.add_clause([inputs['d_i'].name, -inputs['node_name'].name])
    else:
        solver.add_clause([-inputs['D'].name, inputs['node_name'].name])
        solver.add_clause([inputs['D'].name, -inputs['node_name'].name])

def prim_flop_inv(inputs: dict, graph: nx.DiGraph, solver):
    """ Register.

    Args:
        inputs: {'d_i/D', 'node_name'}.
        graph: The networkx graph of the circuit.

    Returns:
        Q = ! d_i/D.
    """
    if "d_i" in inputs:
        solver.add_clause([-inputs['d_i'].name, -inputs['node_name'].name])
        solver.add_clause([inputs['d_i'].name, inputs['node_name'].name])
    else:
        solver.add_clause([-inputs['D'].name, -inputs['node_name'].name])
        solver.add_clause([inputs['D'].name, inputs['node_name'].name])

def output(inputs: dict, graph: nx.DiGraph, solver):
    """ Out node.

    Args:
        inputs: {'input_0', 'node_name'}.
        graph: The networkx graph of the circuit.

    Returns:
        ZN = input_0.
    """
    p = validate_generic_inputs(inputs, 2, "output")
    solver.add_clause([-p['input_0'], p['node_name']])
    solver.add_clause([p['input_0'], -p['node_name']])

cell_mapping = {
% for mapping in cell_lib.cell_mapping:
  '${mapping}': ${mapping},
% endfor
  'xnor_O': xnor,
  'xor_O': xor,
  'and_O': and_output,
  'or_O': or_output,
  'prim_flop': prim_flop,
  'prim_flop_fault': prim_flop_inv,
  'prim_buf': prim_buf,
  'prim_buf_fault': prim_buf_inv,
  'input_fault_q_o': input_formula_QN,
  'input_q_o': input_formula_Q,
  'input_Q': input_formula_Q,
  'input_QN': input_formula_QN,
  'in_node_Q': in_node_Q,
  'in_node_q_o': in_node_Q,
  'in_node_QN': in_node_QN,
  'out_node_q_o': out_node,
  'out_node_Q': out_node,
  'out_node_QN': out_node,
  'output_O': output,
  'output_q_o': output
}
