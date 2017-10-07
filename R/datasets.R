#' Dataset with news messages and the news groups they belong to
#'
#' @description Multilabel dataset from the text domain. The original name of the dataset is \code{20ng}
#' @format An mldr object with 19300 instances, 1006 attributes and 20 labels
#' @source Ken Lang, "Newsweeder: Learning to filter netnews", in Proc. 12th International Conference on Machine Learning, pp. 331-339, 1995
#' @examples
#'\dontrun{
#' toBibtex(ng20)
#' ng20$measures
#' }
"ng20"

#'  Dataset with BibTeX entries
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 7395 instances, 1836 attributes and 159 labels
#' @source Katakis, I. and Tsoumakas, G. and Vlahavas, I., "Multilabel Text Classification for Automated Tag Suggestion", in Proc. ECML PKDD08 Discovery Challenge, Antwerp, Belgium, pp. 75-83, 2008
#' @examples
#'\dontrun{
#' bibtex()  # Check and load the dataset
#' toBibtex(bibtex)
#' bibtex$measures
#' }
#' @export
bibtex <- function() check_n_load.mldr("bibtex")

#'  Dataset with sounds produced by birds and the species they belong to
#'
#' @description Multilabel dataset from the sound domain.
#' @format An mldr object with 645 instances, 260 attributes and 19 labels
#' @source Briggs, F. and Lakshminarayanan, B. and Neal, L. and Fern, X. Z. and Raich, R. and Hadley, S. J. K. and Hadley, A. S. and Betts, M. G., "Acoustic classification of multiple simultaneous bird species: A multi-instance multi-label approach", The Journal of the Acoustical Society of America, (6)131, pp. 4640--4650, 2012
#' @examples
#'\dontrun{
#' toBibtex(birds)
#' birds$measures
#' }
"birds"

#'  Dataset with data from web bookmarks and their categories
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 87856 instances, 2150 attributes and 208 labels
#' @source Katakis, I. and Tsoumakas, G. and Vlahavas, I., "Multilabel Text Classification for Automated Tag Suggestion", in Proc. ECML PKDD08 Discovery Challenge, Antwerp, Belgium, pp. 75-83, 2008
#' @examples
#'\dontrun{
#' bookmarks()  # Check and load the dataset
#' toBibtex(bookmarks)
#' bookmarks$measures
#' }
#' @export
bookmarks <- function() check_n_load.mldr("bookmarks")

#'  Dataset with music data along with labels for emotions, instruments, genres, etc.
#'
#' @description Multilabel dataset from the music domain.
#' @format An mldr object with 502 instances, 68 attributes and 174 labels
#' @source Turnbull, Douglas and Barrington, Luke and Torres, David and Lanckriet, Gert, "Semantic annotation and retrieval of music and sound effects", Audio, Speech, and Language Processing, IEEE Transactions on, (2)16, pp. 467-476, 2008
#' @examples
#'\dontrun{
#' toBibtex(cal500)
#' cal500$measures
#' }
"cal500"

#'  Datasets with data from the Corel image collection. There are 10 subsets in corel16k
#'
#' @description Multilabel dataset from the image domain.
#' @format An mldr object with 13766 instances, 500 attributes and 153 labels
#' @source Barnard, K. and Duygulu, P. and Forsyth, D. and de Freitas, N. and Blei, D. M. and Jordan, M. I., "Matching words and pictures", Journal of Machine Learning Research, Vol. 3, pp. 1107--1135, 2003
#' @examples
#'\dontrun{
#' corel16k001()  # Check and load the dataset
#' toBibtex(corel16k001)
#' corel16k001$measures
#' }
#' @export
corel16k001 <- function() check_n_load.mldr('corel16k001')

#'  Datasets with data from the Corel image collection. There are 10 subsets in corel16k
#'
#' @description Multilabel dataset from the image domain.
#' @format An mldr object with 13761 instances, 500 attributes and 164 labels
#' @source Barnard, K. and Duygulu, P. and Forsyth, D. and de Freitas, N. and Blei, D. M. and Jordan, M. I., "Matching words and pictures", Journal of Machine Learning Research, Vol. 3, pp. 1107--1135, 2003
#' @examples
#'\dontrun{
#' corel16k002()  # Check and load the dataset
#' toBibtex(corel16k002)
#' corel16k002$measures
#' }
#' @export
corel16k002 <- function() check_n_load.mldr('corel16k002')

#'  Datasets with data from the Corel image collection. There are 10 subsets in corel16k
#'
#' @description Multilabel dataset from the image domain.
#' @format An mldr object with 13760 instances, 500 attributes and 154 labels
#' @source Barnard, K. and Duygulu, P. and Forsyth, D. and de Freitas, N. and Blei, D. M. and Jordan, M. I., "Matching words and pictures", Journal of Machine Learning Research, Vol. 3, pp. 1107--1135, 2003
#' @examples
#'\dontrun{
#' corel16k003()  # Check and load the dataset
#' toBibtex(corel16k003)
#' corel16k003$measures
#' }
#' @export
corel16k003 <- function() check_n_load.mldr('corel16k003')

#'  Datasets with data from the Corel image collection. There are 10 subsets in corel16k
#'
#' @description Multilabel dataset from the image domain.
#' @format An mldr object with 13837 instances, 500 attributes and 162 labels
#' @source Barnard, K. and Duygulu, P. and Forsyth, D. and de Freitas, N. and Blei, D. M. and Jordan, M. I., "Matching words and pictures", Journal of Machine Learning Research, Vol. 3, pp. 1107--1135, 2003
#' @examples
#'\dontrun{
#' corel16k004()  # Check and load the dataset
#' toBibtex(corel16k004)
#' corel16k004$measures
#' }
#' @export
corel16k004 <- function() check_n_load.mldr('corel16k004')

#'  Datasets with data from the Corel image collection. There are 10 subsets in corel16k
#'
#' @description Multilabel dataset from the image domain.
#' @format An mldr object with 13847 instances, 500 attributes and 160 labels
#' @source Barnard, K. and Duygulu, P. and Forsyth, D. and de Freitas, N. and Blei, D. M. and Jordan, M. I., "Matching words and pictures", Journal of Machine Learning Research, Vol. 3, pp. 1107--1135, 2003
#' @examples
#'\dontrun{
#' corel16k005()  # Check and load the dataset
#' toBibtex(corel16k005)
#' corel16k005$measures
#' }
#' @export
corel16k005 <- function() check_n_load.mldr('corel16k005')

#'  Datasets with data from the Corel image collection. There are 10 subsets in corel16k
#'
#' @description Multilabel dataset from the image domain.
#' @format An mldr object with 13859 instances, 500 attributes and 162 labels
#' @source Barnard, K. and Duygulu, P. and Forsyth, D. and de Freitas, N. and Blei, D. M. and Jordan, M. I., "Matching words and pictures", Journal of Machine Learning Research, Vol. 3, pp. 1107--1135, 2003
#' @examples
#'\dontrun{
#' corel16k006()  # Check and load the dataset
#' toBibtex(corel16k006)
#' corel16k006$measures
#' }
#' @export
corel16k006 <- function() check_n_load.mldr('corel16k006')

#'  Datasets with data from the Corel image collection. There are 10 subsets in corel16k
#'
#' @description Multilabel dataset from the image domain.
#' @format An mldr object with 13915 instances, 500 attributes and 174 labels
#' @source Barnard, K. and Duygulu, P. and Forsyth, D. and de Freitas, N. and Blei, D. M. and Jordan, M. I., "Matching words and pictures", Journal of Machine Learning Research, Vol. 3, pp. 1107--1135, 2003
#' @examples
#'\dontrun{
#' corel16k007()  # Check and load the dataset
#' toBibtex(corel16k007)
#' corel16k007$measures
#' }
#' @export
corel16k007 <- function() check_n_load.mldr('corel16k007')

#'  Datasets with data from the Corel image collection. There are 10 subsets in corel16k
#'
#' @description Multilabel dataset from the image domain.
#' @format An mldr object with 13864 instances, 500 attributes and 168 labels
#' @source Barnard, K. and Duygulu, P. and Forsyth, D. and de Freitas, N. and Blei, D. M. and Jordan, M. I., "Matching words and pictures", Journal of Machine Learning Research, Vol. 3, pp. 1107--1135, 2003
#' @examples
#'\dontrun{
#' corel16k008()  # Check and load the dataset
#' toBibtex(corel16k008)
#' corel16k008$measures
#' }
#' @export
corel16k008 <- function() check_n_load.mldr('corel16k008')

#'  Datasets with data from the Corel image collection. There are 10 subsets in corel16k
#'
#' @description Multilabel dataset from the image domain.
#' @format An mldr object with 13884 instances, 500 attributes and 173 labels
#' @source Barnard, K. and Duygulu, P. and Forsyth, D. and de Freitas, N. and Blei, D. M. and Jordan, M. I., "Matching words and pictures", Journal of Machine Learning Research, Vol. 3, pp. 1107--1135, 2003
#' @examples
#'\dontrun{
#' corel16k009()  # Check and load the dataset
#' toBibtex(corel16k009)
#' corel16k009$measures
#' }
#' @export
corel16k009 <- function() check_n_load.mldr('corel16k009')

#'  Datasets with data from the Corel image collection. There are 10 subsets in corel16k
#'
#' @description Multilabel dataset from the image domain.
#' @format An mldr object with 13618 instances, 500 attributes and 144 labels
#' @source Barnard, K. and Duygulu, P. and Forsyth, D. and de Freitas, N. and Blei, D. M. and Jordan, M. I., "Matching words and pictures", Journal of Machine Learning Research, Vol. 3, pp. 1107--1135, 2003
#' @examples
#'\dontrun{
#' corel16k010()  # Check and load the dataset
#' toBibtex(corel16k010)
#' corel16k010$measures
#' }
#' @export
corel16k010 <- function() check_n_load.mldr('corel16k010')

#'  Dataset with data from the Corel image collection
#'
#' @description Multilabel dataset from the image domain.
#' @format An mldr object with 5000 instances, 499 attributes and 374 labels
#' @source Duygulu, P. and Barnard, K. and de Freitas, J.F.G. and Forsyth, D.A., "Object Recognition as Machine Translation: Learning a Lexicon for a Fixed Image Vocabulary", Computer Vision, ECCV 2002, pp. 97-112, 2002
#' @examples
#'\dontrun{
#' corel5k()  # Check and load the dataset
#' toBibtex(corel5k)
#' corel5k$measures
#' }
#' @export
corel5k <- function() check_n_load.mldr("corel5k")

#'  Dataset generated from the del.icio.us site bookmarks
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 16105 instances, 500 attributes and 983 labels
#' @source Tsoumakas, G. and Katakis, I. and Vlahavas, I., "Effective and Efficient Multilabel Classification in Domains with Large Number of Labels", in Proc. ECML/PKDD Workshop on Mining Multidimensional Data, Antwerp, Belgium, MMD08, pp. 30--44, 2008
#' @examples
#'\dontrun{
#' delicious()  # Check and load the dataset
#' toBibtex(delicious)
#' delicious$measures
#' }
#' @export
delicious <- function() check_n_load.mldr('delicious')

#'  Dataset with features extracted from music tracks and the emotions they produce
#'
#' @description Multilabel dataset from the music domain.
#' @format An mldr object with 593 instances, 72 attributes and 6 labels
#' @source Wieczorkowska, A. and Synak, P. and Ra'{s}, Z., "Multi-Label Classification of Emotions in Music", Intelligent Information Processing and Web Mining, Vol. 35, Chap. 30, pp. 307-315, 2006
#' @examples
#'\dontrun{
#' toBibtex(emotions)
#' emotions$measures
#' }
"emotions"

#'  Dataset with email messages and the folders where the users stored them
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 1702 instances, 1001 attributes and 53 labels
#' @source Klimt, B. and Yang, Y., "The Enron Corpus: A New Dataset for Email Classification Research", in Proc. ECML04, Pisa, Italy, pp. 217-226, 2004
#' @examples
#'\dontrun{
#' enron()  # Check and load the dataset
#' toBibtex(enron)
#' enron$measures
#' }
#' @export
enron <- function() check_n_load.mldr("enron")

#'  List  with 10 folds of the test data from the EUR-Lex directory codes dataset
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 1935 instances, 5000 attributes and 412 labels
#' @source Mencia, E. L. and Furnkranz, J., "Efficient pairwise multilabel classification for large-scale problems in the legal domain", Machine Learning and Knowledge Discovery in Databases, pp. 50--65, 2008
#' @examples
#'\dontrun{
#' eurlexdc_test()  # Check and load the dataset
#' toBibtex(eurlexdc_test[[1]])
#' eurlexdc_test[[1]]$measures
#' }
#' @export
eurlexdc_test <- function() check_n_load.mldr('eurlexdc_test')

#'  List  with 10 folds of the train data from the EUR-Lex directory codes dataset
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 17413 instances, 5000 attributes and 412 labels
#' @source Mencia, E. L. and Furnkranz, J., "Efficient pairwise multilabel classification for large-scale problems in the legal domain", Machine Learning and Knowledge Discovery in Databases, pp. 50--65, 2008
#' @examples
#'\dontrun{
#' eurlexdc_tra()  # Check and load the dataset
#' toBibtex(eurlexdc_test[[1]])
#' eurlexdc_test[[1]]$measures
#' }
#' @export
eurlexdc_tra <- function() check_n_load.mldr('eurlexdc_tra')

#'  List  with 10 folds of the test data from the EUR-Lex EUROVOC descriptors dataset
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 1935 instances, 5000 attributes and 3993 labels
#' @source Mencia, E. L. and Furnkranz, J., "Efficient pairwise multilabel classification for large-scale problems in the legal domain", Machine Learning and Knowledge Discovery in Databases, pp. 50--65, 2008
#' @examples
#'\dontrun{
#' eurlexev_test()  # Check and load the dataset
#' toBibtex(eurlexev_test[[1]])
#' eurlexev_test[[1]]$measures
#' }
#' @export
eurlexev_test <- function() check_n_load.mldr('eurlexev_test')

#'  List  with 10 folds of the train data from the EUR-Lex EUROVOC descriptors dataset
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 17413 instances, 5000 attributes and 3993 labels
#' @source Mencia, E. L. and Furnkranz, J., "Efficient pairwise multilabel classification for large-scale problems in the legal domain", Machine Learning and Knowledge Discovery in Databases, pp. 50--65, 2008
#' @examples
#'\dontrun{
#' eurlexev_tra()  # Check and load the dataset
#' toBibtex(eurlexev_tra[[1]])
#' eurlexev_tra[[1]]$measures
#' }
#' @export
eurlexev_tra <- function() check_n_load.mldr('eurlexev_tra')

#'  List  with 10 folds of the test data from the EUR-Lex subject matters dataset
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 1935 instances, 5000 attributes and 201 labels
#' @source Mencia, E. L. and Furnkranz, J., "Efficient pairwise multilabel classification for large-scale problems in the legal domain", Machine Learning and Knowledge Discovery in Databases, pp. 50--65, 2008
#' @examples
#'\dontrun{
#' eurlexsm_test()  # Check and load the dataset
#' toBibtex(eurlexsm_test[[1]])
#' eurlexsm_test[[1]]$measures
#' }
#' @export
eurlexsm_test <- function() check_n_load.mldr('eurlexsm_test')

#'  List  with 10 folds of the train data from the EUR-Lex subject matters dataset
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 17413 instances, 5000 attributes and 201 labels
#' @source Mencia, E. L. and Furnkranz, J., "Efficient pairwise multilabel classification for large-scale problems in the legal domain", Machine Learning and Knowledge Discovery in Databases, pp. 50--65, 2008
#' @examples
#'\dontrun{
#' eurlexsm_tra()  # Check and load the dataset
#' toBibtex(eurlexsm_tra[[1]])
#' eurlexsm_tra[[1]]$measures
#' }
#' @export
eurlexsm_tra <- function() check_n_load.mldr('eurlexsm_tra')

#'  Dataset with features correspoinding to world flags
#'
#' @description Multilabel dataset from the image domain.
#' @format An mldr object with 194 instances, 19 attributes and 7 labels
#' @source Goncalves, E. C. and Plastino, A. and Freitas, A. A., "A genetic algorithm for optimizing the label ordering in multi-label classifier chains", Tools with Artificial Intelligence (ICTAI), 2013 IEEE 25th International Conference on, pp. 469-476, 2013
#' @examples
#'\dontrun{
#' toBibtex(flags)
#' flags$measures
#' }
"flags"

#'  Dataset with genes data and their functional expression
#'
#' @description Multilabel dataset from the biology domain.
#' @format An mldr object with 662 instances, 1186 attributes and 27 labels
#' @source Diplaris, S. and Tsoumakas, G. and Mitkas, P. and Vlahavas, I., "Protein Classification with Multiple Algorithms", in Proc. 10th Panhellenic Conference on Informatics, Volos, Greece, PCI05, pp. 448--456, 2005
#' @examples
#'\dontrun{
#' toBibtex(genbase)
#' genbase$measures
#' }
"genbase"

#'  Dataset generated from the IMDB film database
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 120919 instances, 1001 attributes and 28 labels
#' @source Read, J. and Pfahringer, B. and Holmes, G. and Frank, E., "Classifier chains for multi-label classification", Machine Learning, (3)85, pp. 333-359, 2011
#' @examples
#'\dontrun{
#' imdb()  # Check and load the dataset
#' toBibtex(imdb)
#' imdb$measures
#' }
#' @export
imdb <- function() check_n_load.mldr('imdb')

#'  Dataset with data from the Language forum discussion
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 1460 instances, 1004 attributes and 75 labels
#' @source Read, Jesse, "Scalable multi-label classification", University of Waikato, 2010
#' @examples
#'\dontrun{
#' toBibtex(langlog)
#' langlog$measures
#' }
"langlog"

#'  Dataset with features extracted from video sequences and semantic concepts assigned as labels
#'
#' @description Multilabel dataset from the video domain.
#' @format An mldr object with 43907 instances, 120 attributes and 101 labels
#' @source Snoek, C. G. M. and Worring, M. and van Gemert, J. C. and Geusebroek, J. M. and Smeulders, A. W. M., "The challenge problem for automated detection of 101 semantic concepts in multimedia", in Proc. 14th ACM International Conference on Multimedia, MULTIMEDIA06, pp. 421-430, 2006
#' @examples
#'\dontrun{
#' mediamill()  # Check and load the dataset
#' toBibtex(mediamill)
#' mediamill$measures
#' }
#' @export
mediamill <- function() check_n_load.mldr('mediamill')

#'  Dataset generated from medical reports
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 978 instances, 1449 attributes and 45 labels
#' @source Crammer, K. and Dredze, M. and Ganchev, K. and Talukdar, P. P. and Carroll, S., "Automatic Code Assignment to Medical Text", in Proc. Workshop on Biological, Translational, and Clinical Language Processing,  Prague, Czech Republic, BioNLP07, pp. 129-136, 2007
#' @examples
#'\dontrun{
#' toBibtex(medical)
#' medical$measures
#' }
"medical"

#'  Dataset obtained from the NUS-WIDE database with BoW representation
#'
#' @description Multilabel dataset from the image domain.
#' @format An mldr object with 269648 instances, 501 attributes and 81 labels
#' @source Chua, Tat-Seng and Tang, Jinhui and Hong, Richang and Li, Haojie and Luo, Zhiping and Zheng, Yantao, "NUS-WIDE: a real-world web image database from National University of Singapore", in Proc. of the ACM international conference on image and video retrieval, pp. 48, 2009
#' @examples
#'\dontrun{
#' nuswide_BoW()  # Check and load the dataset
#' toBibtex(nuswide_BoW)
#' nuswide_BoW$measures
#' }
#' @export
nuswide_BoW <- function() check_n_load.mldr('nuswide_BoW')

#'  Dataset obtained from the NUS-WIDE database with cVLAD+ representation
#'
#' @description Multilabel dataset from the image domain.
#' @format An mldr object with 269648 instances, 129 attributes and 81 labels
#' @source Chua, Tat-Seng and Tang, Jinhui and Hong, Richang and Li, Haojie and Luo, Zhiping and Zheng, Yantao, "NUS-WIDE: a real-world web image database from National University of Singapore", in Proc. of the ACM international conference on image and video retrieval, pp. 48, 2009
#' @examples
#'\dontrun{
#' nuswide_VLAD()  # Check and load the dataset
#' toBibtex(nuswide_VLAD)
#' nuswide_VLAD$measures
#' }
#' @export
nuswide_VLAD <- function() check_n_load.mldr('nuswide_VLAD')

#'  Dataset generated from a subset of the Medline database
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 13929 instances, 1002 attributes and 23 labels
#' @source Joachims, Thorsten, "Text Categorization with Suport Vector Machines: Learning with Many Relevant Features", in Proc. 10th European Conference on Machine Learning, pp. 137-142, 1998
#' @examples
#'\dontrun{
#' ohsumed()  # Check and load the dataset
#' toBibtex(ohsumed)
#' ohsumed$measures
#' }
#' @export
ohsumed <- function() check_n_load.mldr('ohsumed')

#'  Dataset from the Reuters corpus (subset 1)
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 6000 instances, 47236 attributes and 101 labels
#' @source Lewis, D. D. and Yang, Y. and Rose, T. G. and Li, F., "RCV1: A new benchmark collection for text categorization research", The Journal of Machine Learning Research, Vol. 5, pp. 361-397, 2004
#' @examples
#'\dontrun{
#' rcv1sub1()  # Check and load the dataset
#' toBibtex(rcv1sub1)
#' rcv1sub1$measures
#' }
#' @export
rcv1sub1 <- function() check_n_load.mldr('rcv1sub1')

#'  Dataset from the Reuters corpus (subset 2)
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 6000 instances, 47236 attributes and 101 labels
#' @source Lewis, D. D. and Yang, Y. and Rose, T. G. and Li, F., "RCV1: A new benchmark collection for text categorization research", The Journal of Machine Learning Research, Vol. 5, pp. 361-397, 2004
#' @examples
#'\dontrun{
#' rcv1sub2()  # Check and load the dataset
#' toBibtex(rcv1sub2)
#' rcv1sub2$measures
#' }
#' @export
rcv1sub2 <- function() check_n_load.mldr('rcv1sub2')

#'  Dataset from the Reuters corpus (subset 3)
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 6000 instances, 47236 attributes and 101 labels
#' @source Lewis, D. D. and Yang, Y. and Rose, T. G. and Li, F., "RCV1: A new benchmark collection for text categorization research", The Journal of Machine Learning Research, Vol. 5, pp. 361-397, 2004
#' @examples
#'\dontrun{
#' rcv1sub3()  # Check and load the dataset
#' toBibtex(rcv1sub3)
#' rcv1sub3$measures
#' }
#' @export
rcv1sub3 <- function() check_n_load.mldr('rcv1sub3')

#'  Dataset from the Reuters corpus (subset 4)
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 6000 instances, 47229 attributes and 101 labels
#' @source Lewis, D. D. and Yang, Y. and Rose, T. G. and Li, F., "RCV1: A new benchmark collection for text categorization research", The Journal of Machine Learning Research, Vol. 5, pp. 361-397, 2004
#' @examples
#'\dontrun{
#' rcv1sub4()  # Check and load the dataset
#' toBibtex(rcv1sub4)
#' rcv1sub4$measures
#' }
#' @export
rcv1sub4 <- function() check_n_load.mldr('rcv1sub4')

#'  Dataset from the Reuters corpus (subset 5)
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 6000 instances, 47235 attributes and 101 labels
#' @source Lewis, D. D. and Yang, Y. and Rose, T. G. and Li, F., "RCV1: A new benchmark collection for text categorization research", The Journal of Machine Learning Research, Vol. 5, pp. 361-397, 2004
#' @examples
#'\dontrun{
#' rcv1sub5()  # Check and load the dataset
#' toBibtex(rcv1sub5)
#' rcv1sub5$measures
#' }
#' @export
rcv1sub5 <- function() check_n_load.mldr('rcv1sub5')

#' Dataset from the Reuters Corpus with the 500 most relevant features selected
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 6000 instances, 500 attributes and 103 labels
#' @source Read, Jesse, "Scalable multi-label classification", University of Waikato, 2010
#' @examples
#'\dontrun{
#' reutersk500()  # Check and load the dataset
#' toBibtex(reutersk500)
#' reutersk500$measures
#' }
#' @export
reutersk500 <- function() check_n_load.mldr('reutersk500')

#'  Dataset from images with different natural scenes
#'
#' @description Multilabel dataset from the image domain.
#' @format An mldr object with 2407 instances, 294 attributes and 6 labels
#' @source Boutell, M. and Luo, J. and Shen, X. and Brown, C., "Learning multi-label scene classification", Pattern Recognition, (9)37, pp. 1757--1771, 2004
#' @examples
#'\dontrun{
#' scene()
#' toBibtex(scene)
#' scene$measures
#' }
scene <- function() check_n_load.mldr('scene')

#'  Dataset generated from slashdot.org site entries
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 3782 instances, 1079 attributes and 22 labels
#' @source Read, J. and Pfahringer, B. and Holmes, G. and Frank, E., "Classifier chains for multi-label classification", Machine Learning, (3)85, pp. 333--359, 2011
#' @examples
#'\dontrun{
#' toBibtex(slashdot)
#' slashdot$measures
#' }
"slashdot"

#'  Dataset from the Stack Exchange's chemistry forum
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 6961 instances, 540 attributes and 175 labels
#' @source Charte, Francisco and Rivera, Antonio J. and del Jesus, Maria J. and Herrera, Francisco, "QUINTA: A question tagging assistant to improve the answering ratio in electronic forums", in EUROCON 2015 - International Conference on Computer as a Tool (EUROCON), IEEE, pp. 1-6, 2015
#' @examples
#'\dontrun{
#' stackex_chemistry()  # Check and load the dataset
#' toBibtex(stackex_chemistry)
#' stackex_chemistry$measures
#' }
#' @export
stackex_chemistry <- function() check_n_load.mldr('stackex_chemistry')

#'  Dataset from the Stack Exchange's chess forum
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 1675 instances, 585 attributes and 227 labels
#' @source Charte, Francisco and Rivera, Antonio J. and del Jesus, Maria J. and Herrera, Francisco, "QUINTA: A question tagging assistant to improve the answering ratio in electronic forums", in EUROCON 2015 - International Conference on Computer as a Tool (EUROCON), IEEE, pp. 1-6, 2015
#' @examples
#'\dontrun{
#' toBibtex(stackex_chess)
#' stackex_chess$measures
#' }
"stackex_chess"

#'  Dataset from the Stack Exchange's coffee forum
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 225 instances, 1763 attributes and 123 labels
#' @source Charte, Francisco and Rivera, Antonio J. and del Jesus, Maria J. and Herrera, Francisco, "QUINTA: A question tagging assistant to improve the answering ratio in electronic forums", in EUROCON 2015 - International Conference on Computer as a Tool (EUROCON), IEEE, pp. 1-6, 2015
#' @examples
#'\dontrun{
#' stackex_coffee()
#' toBibtex(stackex_coffee)
#' stackex_coffee$measures
#' }
#' @export
stackex_coffee <- function() check_n_load.mldr('stackex_coffee')

#'  Dataset from the Stack Exchange's cooking forum
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 10491 instances, 577 attributes and 400 labels
#' @source Charte, Francisco and Rivera, Antonio J. and del Jesus, Maria J. and Herrera, Francisco, "QUINTA: A question tagging assistant to improve the answering ratio in electronic forums", in EUROCON 2015 - International Conference on Computer as a Tool (EUROCON), IEEE, pp. 1-6, 2015
#' @examples
#'\dontrun{
#' stackex_cooking()  # Check and load the dataset
#' toBibtex(stackex_cooking)
#' stackex_cooking$measures
#' }
#' @export
stackex_cooking <- function() check_n_load.mldr('stackex_cooking')

#'  Dataset from the Stack Exchange's computer science forum
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 9270 instances, 635 attributes and 274 labels
#' @source Charte, Francisco and Rivera, Antonio J. and del Jesus, Maria J. and Herrera, Francisco, "QUINTA: A question tagging assistant to improve the answering ratio in electronic forums", in EUROCON 2015 - International Conference on Computer as a Tool (EUROCON), IEEE, pp. 1-6, 2015
#' @examples
#'\dontrun{
#' stackex_cs()  # Check and load the dataset
#' toBibtex(stackex_cs)
#' stackex_cs$measures
#' }
#' @export
stackex_cs <- function() check_n_load.mldr('stackex_cs')

#'  Dataset from the Stack Exchange's philosophy forum
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 3971 instances, 842 attributes and 233 labels
#' @source Charte, Francisco and Rivera, Antonio J. and del Jesus, Maria J. and Herrera, Francisco, "QUINTA: A question tagging assistant to improve the answering ratio in electronic forums", in EUROCON 2015 - International Conference on Computer as a Tool (EUROCON), IEEE, pp. 1-6, 2015
#' @examples
#'\dontrun{
#' stackex_philosophy()  # Check and load the dataset
#' toBibtex(stackex_philosophy)
#' stackex_philosophy$measures
#' }
#' @export
stackex_philosophy <- function() check_n_load.mldr('stackex_philosophy')

#'  Dataset from airplanes failures reports
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 28596 instances, 49060 attributes and 22 labels
#' @source Srivastava, A. N. and Zane-Ulman, B., "Discovering recurring anomalies in text reports regarding complex space systems", Aerospace Conference, pp. 3853-3862, 2005
#' @examples
#'\dontrun{
#' tmc2007()  # Check and load the dataset
#' toBibtex(tmc2007)
#' tmc2007$measures
#' }
#' @export
tmc2007 <- function() check_n_load.mldr('tmc2007')

#'  Dataset from airplanes failures reports (500 most relevant features extracted)
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 28596 instances, 500 attributes and 22 labels
#' @source Srivastava, A. N. and Zane-Ulman, B., "Discovering recurring anomalies in text reports regarding complex space systems", Aerospace Conference, pp. 3853-3862, 2005
#' @examples
#'\dontrun{
#' tmc2007_500()  # Check and load the dataset
#' toBibtex(tmc2007_500)
#' tmc2007_500$measures
#' }
#' @export
tmc2007_500 <- function() check_n_load.mldr('tmc2007_500')

#' Dataset generated from the Yahoo! web site index (arts category)
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 7484 instances, 23146 attributes and 26 labels
#' @source Ueda, N. and Saito, K., "Parametric mixture models for multi-labeled text", Advances in neural information processing systems, pp. 721--728, 2002
#' @examples
#'\dontrun{
#' yahoo_arts()  # Check and load the dataset
#' toBibtex(yahoo_arts)
#' yahoo_arts$measures
#' }
#' @export
yahoo_arts <- function() check_n_load.mldr('yahoo_arts')

#' Dataset generated from the Yahoo! web site index (business category)
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 11214 instances, 21924 attributes and 30 labels
#' @source Ueda, N. and Saito, K., "Parametric mixture models for multi-labeled text", Advances in neural information processing systems, pp. 721--728, 2002
#' @examples
#'\dontrun{
#' yahoo_business()  # Check and load the dataset
#' toBibtex(yahoo_business)
#' yahoo_business$measures
#' }
#' @export
yahoo_business <- function() check_n_load.mldr('yahoo_business')

#' Dataset generated from the Yahoo! web site index (computers category)
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 12444 instances, 34096 attributes and 33 labels
#' @source Ueda, N. and Saito, K., "Parametric mixture models for multi-labeled text", Advances in neural information processing systems, pp. 721--728, 2002
#' @examples
#'\dontrun{
#' yahoo_computers()  # Check and load the dataset
#' toBibtex(yahoo_computers)
#' yahoo_computers$measures
#' }
#' @export
yahoo_computers <- function() check_n_load.mldr('yahoo_computers')

#' Dataset generated from the Yahoo! web site index (arts education)
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 12030 instances, 27534 attributes and 33 labels
#' @source Ueda, N. and Saito, K., "Parametric mixture models for multi-labeled text", Advances in neural information processing systems, pp. 721--728, 2002
#' @examples
#'\dontrun{
#' yahoo_education()  # Check and load the dataset
#' toBibtex(yahoo_education)
#' yahoo_education$measures
#' }
#' @export
yahoo_education <- function() check_n_load.mldr('yahoo_education')

#' Dataset generated from the Yahoo! web site index (arts entertainment)
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 12730 instances, 32001 attributes and 21 labels
#' @source Ueda, N. and Saito, K., "Parametric mixture models for multi-labeled text", Advances in neural information processing systems, pp. 721--728, 2002
#' @examples
#'\dontrun{
#' yahoo_entertainment()  # Check and load the dataset
#' toBibtex(yahoo_entertainment)
#' yahoo_entertainment$measures
#' }
#' @export
yahoo_entertainment <- function() check_n_load.mldr('yahoo_entertainment')

#' Dataset generated from the Yahoo! web site index (health category)
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 8205 instances, 30605 attributes and 32 labels
#' @source Ueda, N. and Saito, K., "Parametric mixture models for multi-labeled text", Advances in neural information processing systems, pp. 721--728, 2002
#' @examples
#'\dontrun{
#' yahoo_health()  # Check and load the dataset
#' toBibtex(yahoo_health)
#' yahoo_health$measures
#' }
#' @export
yahoo_health <- function() check_n_load.mldr('yahoo_health')

#' Dataset generated from the Yahoo! web site index (recreation category)
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 12828 instances, 30324 attributes and 22 labels
#' @source Ueda, N. and Saito, K., "Parametric mixture models for multi-labeled text", Advances in neural information processing systems, pp. 721--728, 2002
#' @examples
#'\dontrun{
#' yahoo_recreation()  # Check and load the dataset
#' toBibtex(yahoo_recreation)
#' yahoo_recreation$measures
#' }
#' @export
yahoo_recreation <- function() check_n_load.mldr('yahoo_recreation')

#' Dataset generated from the Yahoo! web site index (reference category)
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 8027 instances, 39679 attributes and 33 labels
#' @source Ueda, N. and Saito, K., "Parametric mixture models for multi-labeled text", Advances in neural information processing systems, pp. 721--728, 2002
#' @examples
#'\dontrun{
#' yahoo_reference()  # Check and load the dataset
#' toBibtex(yahoo_reference)
#' yahoo_reference$measures
#' }
#' @export
yahoo_reference <- function() check_n_load.mldr('yahoo_reference')

#' Dataset generated from the Yahoo! web site index (science category)
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 6428 instances, 37187 attributes and 40 labels
#' @source Ueda, N. and Saito, K., "Parametric mixture models for multi-labeled text", Advances in neural information processing systems, pp. 721--728, 2002
#' @examples
#'\dontrun{
#' yahoo_science()  # Check and load the dataset
#' toBibtex(yahoo_science)
#' yahoo_science$measures
#' }
#' @export
yahoo_science <- function() check_n_load.mldr('yahoo_science')

#' Dataset generated from the Yahoo! web site index (social category)
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 12111 instances, 52350 attributes and 39 labels
#' @source Ueda, N. and Saito, K., "Parametric mixture models for multi-labeled text", Advances in neural information processing systems, pp. 721--728, 2002
#' @examples
#'\dontrun{
#' yahoo_social()  # Check and load the dataset
#' toBibtex(yahoo_social)
#' yahoo_social$measures
#' }
#' @export
yahoo_social <- function() check_n_load.mldr('yahoo_social')

#' Dataset generated from the Yahoo! web site index (society category)
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 14512 instances, 31802 attributes and 27 labels
#' @source Ueda, N. and Saito, K., "Parametric mixture models for multi-labeled text", Advances in neural information processing systems, pp. 721--728, 2002
#' @examples
#'\dontrun{
#' yahoo_society()  # Check and load the dataset
#' toBibtex(yahoo_society)
#' yahoo_society$measures
#' }
#' @export
yahoo_society <- function() check_n_load.mldr('yahoo_society')

#'  Dataset with protein profiles and their categories
#'
#' @description Multilabel dataset from the biology domain.
#' @format An mldr object with 2417 instances, 103 attributes and 14 labels
#' @source Elisseeff, A. and Weston, J., "A Kernel Method for Multi-Labelled Classification", Advances in Neural Information Processing Systems, Vol. 14, pp. 681--687, 2001
#' @examples
#'\dontrun{
#' yeast()  # Check and load the dataset
#' toBibtex(yeast)
#' yeast$measures
#' }
#' @export
yeast <- function() check_n_load.mldr('yeast')
