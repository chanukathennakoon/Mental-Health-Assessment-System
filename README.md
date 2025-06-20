# Mental Health Assessment System (Prolog)

A rule-based expert system built in Prolog to assess potential mental health conditions based on user-reported symptoms. This system provides a preliminary evaluation and is intended for educational purposes only.

## Features

- **Symptom Database**: Includes 30+ common mental health symptoms
- **Condition Matching**: Covers 9 major mental health conditions
- **Confidence Scoring**: Calculates match percentage for each potential condition
- **Input Validation**: Filters out unrecognized symptoms
- **Interactive Interface**: Guides users through symptom input

## Supported Conditions

1. Depression
2. Anxiety
3. Bipolar Disorder
4. Schizophrenia
5. OCD
6. PTSD
7. ADHD
8. Generalized Anxiety Disorder (GAD)
9. Social Anxiety Disorder
10. Borderline Personality Disorder (BPD)

## Requirements

- SWI-Prolog (version 8.0 or higher recommended)
- Basic understanding of Prolog (to modify/extend the system)

## Installation

1. Install SWI-Prolog from [https://www.swi-prolog.org/](https://www.swi-prolog.org/)
2. Clone this repository or download the `Mental_Health_Assessment_System.pl` file

## Usage

1. Start SWI-Prolog
2. Consult the program file:
   ```prolog
   ?- [path_to_file/Mental_Health_Assessment_System].
3.Run the assessment:
?- start_assessment.
4.Enter your symptoms when prompted (as a Prolog list):
[depressed_mood, fatigue, sleep_disturbances]

## Sample Queries
![image](https://github.com/user-attachments/assets/4714d2f9-b355-4843-94b8-82e591c8f330)

## Customization
To add new conditions or symptoms:
1.Add new symptom facts:
symptom(new_symptom).
2.Add new condition rules:
condition(new_condition, [symptom1, symptom2, ...]).

## Limitations
Not a substitute for professional diagnosis
Simplified matching algorithm (symptom count only)
Doesn't account for symptom severity or duration


   
