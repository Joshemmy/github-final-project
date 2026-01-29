# Simple Interest Calculator

## Project Overview

This project is a simple command-line application designed to calculate simple interest based on user-provided inputs. The Simple Interest Calculator allows users to compute the interest earned on their principal amount given a specific interest rate and time period.

## What is Simple Interest?

Simple interest is a method of calculating interest on a principal amount. It is calculated using the formula:

```
Simple Interest (SI) = (P × R × T) / 100
```

Where:
- **P** = Principal Amount (the initial amount of money)
- **R** = Rate of Interest per annum (annual interest rate in percentage)
- **T** = Time Period (number of years)

## Features

- User-friendly command-line interface
- Input validation for principal, rate of interest, and time period
- Accurate calculation of simple interest
- Display of both simple interest and total amount (Principal + Interest)
- Written in Bash scripting language for easy execution on Unix-based systems

## Project Structure

```
mcino-Introduction-to-Git-and-GitHub/
├── README.md                    # Project documentation
├── LICENSE                      # Apache 2.0 License
├── CODE_OF_CONDUCT.md          # Community guidelines
├── CONTRIBUTING.md             # Contribution guidelines
└── simple-interest.sh           # Main Bash script
```

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/mcino-Introduction-to-Git-and-GitHub.git
```

2. Navigate to the project directory:
```bash
cd mcino-Introduction-to-Git-and-GitHub
```

3. Make the script executable:
```bash
chmod +x simple-interest.sh
```

## Usage

Run the script using:
```bash
./simple-interest.sh
```

The script will prompt you to enter:
1. **Principal Amount (P):** The initial amount of money (in your currency)
2. **Rate of Interest (R):** The annual interest rate (in percentage)
3. **Time Period (T):** The duration for which interest is calculated (in years)

### Example

```
$ ./simple-interest.sh
Enter the Principal Amount: 1000
Enter the Rate of Interest (per annum %): 5
Enter the Time Period (in years): 2

====================================
Simple Interest Calculation Results
====================================
Principal Amount: 1000
Rate of Interest: 5% per annum
Time Period: 2 years
Simple Interest: 100
Total Amount: 1100
====================================
```

## Requirements

- Bash shell (version 3.0 or higher)
- Unix-based operating system (Linux, macOS, etc.) or Git Bash on Windows

## Author

- **Project Name:** Simple Interest Calculator
- **Purpose:** Educational tool for learning Git and GitHub workflows
- **Version:** 1.0.0

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on how to contribute to this project.

## Code of Conduct

Please review our [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) to understand the community standards and expectations.

## License

This project is licensed under the Apache License 2.0. See the [LICENSE](LICENSE) file for more details.

## Acknowledgments

- This project is part of the IBM Developer Skills Network course on Introduction to Git and GitHub
- Thanks to all contributors and community members who help improve this project

## Troubleshooting

### Script doesn't execute
- Ensure the script has execute permissions: `chmod +x simple-interest.sh`
- Verify you're using a Bash-compatible shell

### Invalid input errors
- Ensure you enter numeric values only
- Do not use special characters in the input fields

## Frequently Asked Questions (FAQs)

**Q: Can I use this for negative numbers?**
A: The script is designed for positive values. Negative values may produce unexpected results.

**Q: What if I enter non-numeric values?**
A: The script includes input validation and will prompt you to enter valid numbers.

**Q: Can I modify this script for my needs?**
A: Yes! This project is open source. Feel free to fork it and make modifications according to the license terms.

## Contact & Support

For issues, questions, or suggestions, please open an issue on GitHub or contact the project maintainers.

---

**Last Updated:** January 2026
**Status:** Active Development
