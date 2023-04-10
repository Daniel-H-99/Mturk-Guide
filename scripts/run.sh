#!/bin/sh

n_questions_per_hit=1

n_vigilance_questions_per_hit=1

postfix=".mp4"

base_url="https://mli-mturk.s3.us-east-2.amazonaws.com/"

name='mli-mturk'

description="<li>It may take 5 minutes.</li>
<li> You will take part in an experiment involving visual perception.<br>
You will be shown pairs of images depicting virtual 3D rooms and asked to choose the one you think is more plausible</li>"


prompt="Which one is more plausible?"

n_hits=1

cond_a=ours

cond_b=baseline

output_file='hit.html'

python generate_hit_html.py \
    --n-real-comparisons-per-hit $n_questions_per_hit  \
    --n-vigilance-tests-per-hit $n_vigilance_questions_per_hit \
    --is_video    \
    --postfix $postfix  \
    --base-url $base_url \
    --experiment-description "${description}" \
    --prompt "$prompt"    \
    --out-filename $output_file

python generate_amt_input.py \
    --n-real-comparisons-per-hit $n_questions_per_hit \
    --n-vigilance-tests-per-hit $n_vigilance_questions_per_hit   \
    --n-hits $n_hits    \
    --experiment-name $name \
    --conditionA $cond_a    \
    --conditionB $cond_b

