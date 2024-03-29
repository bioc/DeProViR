% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions.R
\name{predInteractions}
\alias{predInteractions}
\title{Predict Unknown Interactions}
\usage{
predInteractions(
  url_path = "https://nlp.stanford.edu/data",
  Testingset,
  trainedModel
)
}
\arguments{
\item{url_path}{URL path to GloVe embedding. Defaults to
"https://nlp.stanford.edu/data/glove.6B.zip".}

\item{Testingset}{A data.frame containing unknown interactions. For demo,
we can use the file in extdata/test_Set.}

\item{trainedModel}{Pre-trained model stored in extdata/Pre_trainedModel
or the training model "$merge_model" achieved by
\code{\link[DeProViR]{modelTraining}}.}
}
\value{
Probability scores for unknown interactions
}
\description{
This function initially constructs an embedding matrix from
the viral or host protein sequences and then predicts scores for unknown
interactions. Interactions with scores greater than 0.5 are more likely
to indicate interaction.
}
\examples{
trainedModel <- loadPreTrainedModel()
# load test set (i.e., unknown interactions)
testing_set <- data.table::fread(system.file("extdata", "test_Set", 
                               "test_set_unknownInteraction.csv", 
                                package = "DeProViR"))
# now predict interactions
options(timeout=240)
predInteractions <- predInteractions(url_path = "https://nlp.stanford.edu/data",
                                     testing_set,
                                     trainedModel)
}
