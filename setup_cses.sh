#!/bin/bash

# CSES Problem Set - Rust Workspace Setup Script
# Creates category folders and cargo projects for each problem
# Problems are numbered to preserve CSES difficulty ordering

set -e

# Function to convert problem name to valid cargo package name
to_package_name() {
    echo "$1" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g' | sed "s/'//g" | sed 's/[^a-z0-9-]//g' | sed 's/--*/-/g' | sed 's/^-//' | sed 's/-$//'
}

# Function to create problems in a category with numbered prefixes
create_category() {
    local category_dir="$1"
    shift
    local problems=("$@")

    mkdir -p "$category_dir"
    cd "$category_dir"

    local i=1
    for problem in "${problems[@]}"; do
        pkg_name=$(to_package_name "$problem")
        # Zero-pad the number for proper sorting (directory name)
        # Use --name for valid cargo package name (without number prefix)
        numbered_dir=$(printf "%02d-%s" "$i" "$pkg_name")
        if [ ! -d "$numbered_dir" ]; then
            echo "Creating: $category_dir/$numbered_dir"
            cargo new "$numbered_dir" --name "$pkg_name" --vcs none --quiet
        fi
        ((i++))
    done

    cd ..
}

echo "Setting up CSES Problem Set Rust Workspace..."
echo ""

# Introductory Problems (19 problems)
create_category "01-introductory-problems" \
    "Weird Algorithm" \
    "Missing Number" \
    "Repetitions" \
    "Increasing Array" \
    "Permutations" \
    "Number Spiral" \
    "Two Knights" \
    "Two Sets" \
    "Bit Strings" \
    "Trailing Zeros" \
    "Coin Piles" \
    "Palindrome Reorder" \
    "Gray Code" \
    "Tower of Hanoi" \
    "Creating Strings" \
    "Apple Division" \
    "Chessboard and Queens" \
    "Digit Queries" \
    "Grid Paths"

# Sorting and Searching (35 problems)
create_category "02-sorting-and-searching" \
    "Distinct Numbers" \
    "Apartments" \
    "Ferris Wheel" \
    "Concert Tickets" \
    "Restaurant Customers" \
    "Movie Festival" \
    "Sum of Two Values" \
    "Maximum Subarray Sum" \
    "Stick Lengths" \
    "Missing Coin Sum" \
    "Collecting Numbers" \
    "Collecting Numbers II" \
    "Playlist" \
    "Towers" \
    "Traffic Lights" \
    "Josephus Problem I" \
    "Josephus Problem II" \
    "Nested Ranges Check" \
    "Nested Ranges Count" \
    "Room Allocation" \
    "Factory Machines" \
    "Tasks and Deadlines" \
    "Reading Books" \
    "Sum of Three Values" \
    "Sum of Four Values" \
    "Nearest Smaller Values" \
    "Subarray Sums I" \
    "Subarray Sums II" \
    "Subarray Divisibility" \
    "Array Division" \
    "Sliding Median" \
    "Sliding Cost" \
    "Movie Festival II" \
    "Maximum Subarray Sum II"

# Dynamic Programming (19 problems)
create_category "03-dynamic-programming" \
    "Dice Combinations" \
    "Minimizing Coins" \
    "Coin Combinations I" \
    "Coin Combinations II" \
    "Removing Digits" \
    "Grid Paths" \
    "Book Shop" \
    "Array Description" \
    "Counting Towers" \
    "Edit Distance" \
    "Rectangle Cutting" \
    "Money Sums" \
    "Removal Game" \
    "Two Sets II" \
    "Increasing Subsequence" \
    "Projects" \
    "Elevator Rides" \
    "Counting Tilings" \
    "Counting Numbers"

# Graph Algorithms (36 problems)
create_category "04-graph-algorithms" \
    "Counting Rooms" \
    "Labyrinth" \
    "Building Roads" \
    "Message Route" \
    "Building Teams" \
    "Round Trip" \
    "Monsters" \
    "Shortest Routes I" \
    "Shortest Routes II" \
    "High Score" \
    "Flight Discount" \
    "Cycle Finding" \
    "Flight Routes" \
    "Round Trip II" \
    "Course Schedule" \
    "Longest Flight Route" \
    "Game Routes" \
    "Investigation" \
    "Planets Queries I" \
    "Planets Queries II" \
    "Planets Cycles" \
    "Road Reparation" \
    "Road Construction" \
    "Flight Routes Check" \
    "Planets and Kingdoms" \
    "Giant Pizza" \
    "Coin Collector" \
    "Mail Delivery" \
    "De Bruijn Sequence" \
    "Teleporters Path" \
    "Hamiltonian Flights" \
    "Knights Tour" \
    "Download Speed" \
    "Police Chase" \
    "School Dance" \
    "Distinct Routes"

# Range Queries (18 problems)
create_category "05-range-queries" \
    "Static Range Sum Queries" \
    "Static Range Minimum Queries" \
    "Dynamic Range Sum Queries" \
    "Dynamic Range Minimum Queries" \
    "Range Xor Queries" \
    "Range Update Queries" \
    "Forest Queries" \
    "Hotel Queries" \
    "List Removals" \
    "Salary Queries" \
    "Prefix Sum Queries" \
    "Pizzeria Queries" \
    "Subarray Sum Queries" \
    "Distinct Values Queries" \
    "Increasing Array Queries" \
    "Forest Queries II" \
    "Range Updates and Sums" \
    "Polynomial Queries"

# Tree Algorithms (16 problems)
create_category "06-tree-algorithms" \
    "Subordinates" \
    "Tree Matching" \
    "Tree Diameter" \
    "Tree Distances I" \
    "Tree Distances II" \
    "Company Queries I" \
    "Company Queries II" \
    "Distance Queries" \
    "Counting Paths" \
    "Subtree Queries" \
    "Path Queries" \
    "Path Queries II" \
    "Distinct Colors" \
    "Finding a Centroid" \
    "Fixed-Length Paths I" \
    "Fixed-Length Paths II"

# Mathematics (31 problems)
create_category "07-mathematics" \
    "Josephus Queries" \
    "Exponentiation" \
    "Exponentiation II" \
    "Counting Divisors" \
    "Common Divisors" \
    "Sum of Divisors" \
    "Divisor Analysis" \
    "Prime Multiples" \
    "Counting Coprime Pairs" \
    "Binomial Coefficients" \
    "Creating Strings II" \
    "Distributing Apples" \
    "Christmas Party" \
    "Bracket Sequences I" \
    "Bracket Sequences II" \
    "Counting Necklaces" \
    "Counting Grids" \
    "Fibonacci Numbers" \
    "Throwing Dice" \
    "Graph Paths I" \
    "Graph Paths II" \
    "Dice Probability" \
    "Moving Robots" \
    "Candy Lottery" \
    "Inversion Probability" \
    "Stick Game" \
    "Nim Game I" \
    "Nim Game II" \
    "Stair Game" \
    "Grundys Game" \
    "Another Game"

# String Algorithms (17 problems)
create_category "08-string-algorithms" \
    "Word Combinations" \
    "String Matching" \
    "Finding Borders" \
    "Finding Periods" \
    "Minimal Rotation" \
    "Longest Palindrome" \
    "Required Substring" \
    "Palindrome Queries" \
    "Finding Patterns" \
    "Counting Patterns" \
    "Pattern Positions" \
    "Distinct Substrings" \
    "Repeating Substring" \
    "String Functions" \
    "Substring Order I" \
    "Substring Order II" \
    "Substring Distribution"

# Geometry (7 problems)
create_category "09-geometry" \
    "Point Location Test" \
    "Line Segment Intersection" \
    "Polygon Area" \
    "Point in Polygon" \
    "Polygon Lattice Points" \
    "Minimum Euclidean Distance" \
    "Convex Hull"

# Advanced Techniques (24 problems)
create_category "10-advanced-techniques" \
    "Meet in the Middle" \
    "Hamming Distance" \
    "Beautiful Subgrids" \
    "Reachable Nodes" \
    "Reachability Queries" \
    "Cut and Paste" \
    "Substring Reversals" \
    "Reversals and Sums" \
    "Necessary Roads" \
    "Necessary Cities" \
    "Eulerian Subgraphs" \
    "Monster Game I" \
    "Monster Game II" \
    "Subarray Squares" \
    "Houses and Schools" \
    "Knuth Division" \
    "Apples and Bananas" \
    "One Bit Positions" \
    "Signal Processing" \
    "New Roads Queries" \
    "Dynamic Connectivity" \
    "Parcel Delivery" \
    "Task Assignment" \
    "Distinct Routes II"

echo ""
echo "Setup complete! Created Rust projects for CSES Problem Set."
echo "Problems are numbered by difficulty within each category."
echo ""
echo "To get started, cd into any problem directory and edit src/main.rs"
echo "Example: cd 01-introductory-problems/01-weird-algorithm && cargo run"
