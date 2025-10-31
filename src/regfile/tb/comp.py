# function to compare two text files 
def compare_files(file1_path, file2_path):
    try:
        with open(file1_path, 'r') as file1, open(file2_path, 'r') as file2:
            file1_lines = file1.readlines()
            file2_lines = file2.readlines()

            if file1_lines == file2_lines:
                print("The files are identical.")
                return True
            else:
                print("The files are different.")
                print("\nDifferences (line-by-line):")
                for i, (line1, line2) in enumerate(zip(file1_lines, file2_lines), start=1):
                    if line1 != line2:
                        print(f"Line {i}:\n  Golden: {line1.rstrip()}\n  Sim: {line2.rstrip()}")
                
                # Check for extra lines in either file
                if len(file1_lines) != len(file2_lines):
                    longer, name = (file1_lines, "File1") if len(file1_lines) > len(file2_lines) else (file2_lines, "File2")
                    print(f"\nExtra lines in {name}:")
                    for i in range(min(len(file1_lines), len(file2_lines)), len(longer)):
                        print(f"Line {i+1}: {longer[i].rstrip()}")

                return False

    except FileNotFoundError as e:
        print(f"Error: {e}")
        return False

file1 = '/foss/designs/class-2912e-F25-G2/flow/designs/src/regfile/tb/goldenbrick/goldenbrick.txt'
file2 = '/foss/designs/class-2912e-F25-G2/flow/sim/gf180mcuD/regfile/base/rtl_sim_output.txt'
compare_files(file1, file2)