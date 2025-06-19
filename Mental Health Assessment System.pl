% ============================================
% Mental Health Assessment System
% ============================================

% ============================================

% --------------------------------------------
% Knowledge Base
% --------------------------------------------

% List of symptoms
symptom(depressed_mood).
symptom(loss_of_interest).
symptom(fatigue).
symptom(change_in_appetite).
symptom(sleep_disturbances).
symptom(feelings_of_worthlessness).
symptom(difficulty_concentrating).
symptom(thoughts_of_death).
symptom(excessive_worry).
symptom(restlessness).
symptom(irritability).
symptom(muscle_tension).
symptom(difficulty_controlling_worry).
symptom(panic_attacks).
symptom(avoidance_behavior).
symptom(flashbacks).
symptom(nightmares).
symptom(hypervigilance).
symptom(detachment).
symptom(mood_swings).
symptom(impulsive_behavior).
symptom(grandiosity).
symptom(racing_thoughts).
symptom(agitation).
symptom(hallucinations).
symptom(delusions).
symptom(disorganized_speech).
symptom(social_withdrawal).
symptom(apathy).
symptom(flat_affect).

% Conditions and their associated symptoms
% Format: condition(Name, [List of Symptoms]).

% Condition: Depression
condition(depression, [
    depressed_mood,
    loss_of_interest,
    fatigue,
    change_in_appetite,
    sleep_disturbances,
    feelings_of_worthlessness,
    difficulty_concentrating,
    thoughts_of_death
]).

% Condition: Anxiety
condition(anxiety, [
    excessive_worry,
    restlessness,
    fatigue,
    difficulty_concentrating,
    irritability,
    muscle_tension,
    sleep_disturbances,
    panic_attacks
]).

% Condition: Bipolar Disorder
condition(bipolar_disorder, [
    mood_swings,
    elevated_mood,
    impulsivity,
    irritability,
    inflated_self-esteem,
    decreased_need_for_sleep,
    racing_thoughts,
    risky_behavior
]).

% Condition: Schizophrenia
condition(schizophrenia, [
    hallucinations,
    delusions,
    disorganized_thinking,
    social_withdrawal,
    flat_affect,
    cognitive_impairment,
    lack_of_motivation,
    impaired_memory
]).

% Condition: Obsessive-Compulsive Disorder (OCD)
condition(ocd, [
    intrusive_thoughts,
    repetitive_behaviors,
    excessive_cleaning,
    compulsive_counting,
    fear_of_contamination,
    checking_behaviors,
    hoarding,
    distress
]).

% Condition: Post-Traumatic Stress Disorder (PTSD)
condition(ptsd, [
    flashbacks,
    nightmares,
    hypervigilance,
    avoidance_behaviors,
    emotional_numbness,
    irritability,
    difficulty_sleeping,
    intrusive_memories
]).

% Condition: Attention-Deficit/Hyperactivity Disorder (ADHD)
condition(adhd, [
    inattention,
    hyperactivity,
    impulsivity,
    difficulty_following_instructions,
    forgetfulness,
    restlessness,
    difficulty_organizing_tasks,
    distractibility
]).

% Condition: Generalized Anxiety Disorder (GAD)
condition(gad, [
    chronic_worry,
    muscle_tension,
    restlessness,
    difficulty_concentrating,
    fatigue,
    irritability,
    sleep_disturbances,
    nausea
]).

% Condition: Social Anxiety Disorder
condition(social_anxiety_disorder, [
    fear_of_social_situations,
    avoidance_of_social_interactions,
    excessive_self-consciousness,
    sweating,
    trembling,
    rapid_heartbeat,
    nausea,
    difficulty_speaking
]).

% Condition: Borderline Personality Disorder (BPD)
condition(bpd, [
    emotional_instability,
    intense_fear_of_abandonment,
    impulsive_behavior,
    unstable_relationships,
    feelings_of_emptiness,
    self-harm,
    mood_swings,
    difficulty_trusting_others
]).
% --------------------------------------------
% Inference Engine
% --------------------------------------------

% Calculate the match percentage between input symptoms and condition symptoms
match_percentage(InputSymptoms, Condition, Percentage) :-
    condition(Condition, ConditionSymptoms),
    intersection(InputSymptoms, ConditionSymptoms, MatchingSymptoms),
    length(MatchingSymptoms, MatchCount),
    length(ConditionSymptoms, TotalSymptoms),
    Percentage is (MatchCount / TotalSymptoms) * 100.

% Find all possible conditions based on input symptoms with their confidence levels
assess_conditions(InputSymptoms, Results) :-
    findall(
        [Condition, Percentage],
        (condition(Condition, _), match_percentage(InputSymptoms, Condition, Percentage), Percentage > 0),
        UnsortedResults
    ),
    sort(2, @>=, UnsortedResults, Results).

% Display the results in a readable format
display_results([]) :-
    write('No conditions matched your symptoms. Please consult a healthcare professional for proper assessment.'), nl.

display_results([[Condition, Percentage]|Rest]) :-
    format('Possible Condition: ~w (~2f%% confidence)', [Condition, Percentage]), nl,
    display_results(Rest).

% --------------------------------------------
% User Interface
% --------------------------------------------

start_assessment :-
    write('Welcome to the Mental Health Assessment System'), nl,
    write('Please enter your symptoms as a list (e.g., [depressed_mood, fatigue, sleep_disturbances]): '), nl,
    read(UserSymptoms),
    validate_symptoms(UserSymptoms, ValidSymptoms),
    assess_conditions(ValidSymptoms, Results),
    nl,
    write('Assessment Results:'), nl,
    display_results(Results),
    nl,
    write('Disclaimer: This assessment is not a diagnosis. Consult a qualified healthcare professional for proper evaluation.'), nl.

% Validate user input symptoms against known symptoms
validate_symptoms([], []).
validate_symptoms([H|T], [H|ValidT]) :-
    symptom(H),
    validate_symptoms(T, ValidT).
validate_symptoms([H|T], ValidT) :-
    \+ symptom(H),
    format('Warning: ~w is not a recognized symptom and will be ignored.', [H]), nl,
    validate_symptoms(T, ValidT).

% --------------------------------------------
% Sample Query
% --------------------------------------------
% To run the assessment, load this file into your Prolog interpreter and execute:
% ?- start_assessment.
% --------------------------------------------
