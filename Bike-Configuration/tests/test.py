from subprocess import run, PIPE
import json
import os
import sys

def call_clingo(input_file):
    cmd = ['clingo','0','--outf=2','--warn=no-atom-undefined', input_file]  
    output = run(cmd, stdout=PIPE, stderr=PIPE)
    if output.stderr:
        raise RuntimeError("Clingo: %s" % output.stderr)
    return output.stdout

def get_result(output):
    result = output['Result']
    solutions = []
    if not result.startswith('UNSAT'):
        solutions = [w['Value'] for w in output['Call'][len(output['Call'])-1]['Witnesses']]
        for s in solutions:
            s.sort()
        solutions.sort()
    return solutions

def compare_solution(input_file, expected_op_file):
    solution = call_clingo(input_file)
    solution = json.loads(solution)
    with open(expected_op_file,"r") as f:
        expected_solution = json.load(f)
    solution = get_result(solution)
    expected_solution = get_result(expected_solution)
    if solution == expected_solution:
        return 'Success'
    else:
        return 'Failure'
  
def main():
    rootdir = sys.path[0]
    for test in os.listdir(rootdir):
         test_dir = os.path.join(rootdir, test)
         if os.path.isdir(test_dir) and test[:4]=='test':
            sol_file = os.path.join(test_dir,'sol.json')
            test_input = os.path.join(test_dir,'show.lp')
            print(test,compare_solution(test_input,sol_file))      
            
if __name__ == '__main__':
    main()



