# Clear existing data to avoid duplicates
Answer.destroy_all
Question.destroy_all
Survey.destroy_all

# =========================================================================
# SURVEY 1: Q3 Product Experience & Onboarding Evaluation
# =========================================================================
survey_1 = Survey.create!(
  title: "Q3 Product Experience & Onboarding Evaluation",
  description: "Feedback campaign targeting platform adoption, system performance, and user onboarding efficiency."
)

# Quantitative Questions (Survey 1)
s1_q1 = Question.create!(survey: survey_1, question_type: "satisfaction",
  content: "How seamless was the data integration process during your initial onboarding setup?")

s1_q2 = Question.create!(survey: survey_1, question_type: "satisfaction",
  content: "How would you rate the overall UI performance and responsiveness of the main analytics dashboard?")

s1_q3 = Question.create!(survey: survey_1, question_type: "satisfaction",
  content: "How likely are you to recommend this analytics solution to another data engineering or operations team?")

# Qualitative Questions (Survey 1)
s1_q4 = Question.create!(survey: survey_1, question_type: "text",
  content: "What is the single most critical feature or capability our team should prioritize in the next product update?")

s1_q5 = Question.create!(survey: survey_1, question_type: "text",
  content: "Please describe any specific friction points, errors, or performance drops you encountered this quarter:")

# Seed Data / Responses (Survey 1)
Answer.create!([
  { question: s1_q1, content: "5" }, { question: s1_q1, content: "5" }, { question: s1_q1, content: "4" }, { question: s1_q1, content: "3" },
  { question: s1_q2, content: "5" }, { question: s1_q2, content: "4" }, { question: s1_q2, content: "4" }, { question: s1_q2, content: "2" },
  { question: s1_q3, content: "5" }, { question: s1_q3, content: "5" }, { question: s1_q3, content: "4" }, { question: s1_q3, content: "3" },
  { question: s1_q4, content: "We absolutely need native Snowflake and BigQuery streaming connections." },
  { question: s1_q4, content: "Automated PDF report scheduling via Slack webhooks." },
  { question: s1_q5, content: "API latency spikes significantly between 9 AM and 11 AM EST." }
])


# =========================================================================
# SURVEY 2: Post-Support Ticket Resolution & Customer Success
# =========================================================================
survey_2 = Survey.create!(
  title: "Post-Support Ticket Resolution & Customer Success",
  description: "Transactional satisfaction check triggered automatically after technical support case closure."
)

# Quantitative Questions (Survey 2)
s2_q1 = Question.create!(survey: survey_2, question_type: "satisfaction",
  content: "How satisfied are you with the technical expertise of the support engineer who handled your ticket?")

s2_q2 = Question.create!(survey: survey_2, question_type: "satisfaction",
  content: "Rate the speed and responsiveness of our technical support operations:")

# Qualitative Questions (Survey 2)
s2_q3 = Question.create!(survey: survey_2, question_type: "text",
  content: "If your issue wasn't resolved to your satisfaction, please provide additional context:")

s2_q4 = Question.create!(survey: survey_2, question_type: "text",
  content: "Any praise or constructive feedback for the agent who assisted you?")

# Seed Data / Responses (Survey 2 - Different metrics to show variation)
Answer.create!([
  { question: s2_q1, content: "5" }, { question: s2_q1, content: "5" }, { question: s2_q1, content: "5" }, { question: s2_q1, content: "4" }, { question: s2_q1, content: "5" },
  { question: s2_q2, content: "4" }, { question: s2_q2, content: "3" }, { question: s2_q2, content: "5" }, { question: s2_q2, content: "4" }, { question: s2_q2, content: "4" },
  { question: s2_q3, content: "The issue is resolved, but it took three escalations to find someone who understood our architecture." },
  { question: s2_q4, content: "The representative went above and beyond to provide a temporary patch code block." },
  { question: s2_q4, content: "Very fast response time. Under 15 minutes." }
])

puts "Multi-campaign enterprise simulation dataset deployed successfully!"