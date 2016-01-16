# Changelog
## mldr.datasets 0.3.15

* Fixes issues [#1](https://github.com/fcharte/mldr.datasets/issues/1), [#2](https://github.com/fcharte/mldr.datasets/issues/2) and [#3](https://github.com/fcharte/mldr.datasets/issues/3)
* Fixes writing of XML files
* Improve format of ARFF data sections
* Better MLD name extraction from `mld$name`

## mldr.datasets 0.3/0.3.1

First release of *mldr.datasets*. This version includes:

* 59 prebuilt `mldr` objects/functions corresponding to the multilabel datasets detailed below.
* Function `check_n_load.mldr` able to download new objects hosted in the repository
* Specific implementation of the generic `toBibtex` function for `mldr` objects
* `random.kfolds` and `stratified.kfolds` for dataset partitioning
* `write.mldr` function to export `mldr` objects to MULAN, MEKA, KEEL, LibSVM and CSV file formats

* The list of mldr objects ready to be used generated from the following multilabel datasets:
    * **20ng** 
    ~~~
    @inproceedings{,
          author = "Ken Lang",
          title = "Newsweeder: Learning to filter netnews",
          booktitle = "Proc. 12th International Conference on Machine Learning",
          pages = "331--339",
          year = "1995"
    }
    ~~~

    * **bibtex**
    ~~~
    @inproceedings{,
          author = "Katakis, I. and Tsoumakas, G. and Vlahavas, I.",
          title = "Multilabel Text Classification for Automated Tag Suggestion",
          booktitle = "Proc. ECML PKDD08 Discovery Challenge, Antwerp, Belgium",
          pages = "75-83",
          year = "2008"
    }
    ~~~
    
    * **birds**
    ~~~
    @article{,
          title="Acoustic classification of multiple simultaneous bird species: A multi-instance multi-label approach",
          author="Briggs, F. and Lakshminarayanan, B. and Neal, L. and Fern, X. Z. and Raich, R. and Hadley, S. J. K. and Hadley, A. S. and Betts, M. G.",
          journal="The Journal of the Acoustical Society of America",
          volume="131",
          number="6",
          pages="4640--4650",
          year="2012"
    }
    ~~~

    * **bookmarks**
    ~~~
    @inproceedings{,
          author = "Katakis, I. and Tsoumakas, G. and Vlahavas, I.",
          title = "Multilabel Text Classification for Automated Tag Suggestion",
          booktitle = "Proc. ECML PKDD08 Discovery Challenge, Antwerp, Belgium",
          pages = "75-83",
          year = "2008"
    }
    ~~~

    * **cal500**
    ~~~
    @article{,
          title="Semantic annotation and retrieval of music and sound effects",
          author="Turnbull, Douglas and Barrington, Luke and Torres, David and Lanckriet, Gert",
          journal="Audio, Speech, and Language Processing, IEEE Transactions on",
          volume="16",
          number="2",
          pages="467--476",
          year="2008"
    }    
    ~~~
    
    * **corel16k** - 10 subsets of corel16k dataset (`corel16k001` to `corel16k010`)
    ~~~
    @article{,
          title = "Matching words and pictures",
          author = "Barnard, K. and Duygulu, P. and Forsyth, D. and de Freitas, N. and Blei, D. M. and Jordan, M. I.",
          journal = "Journal of Machine Learning Research",
          year = "2003",
          volume = "3",
          pages = "1107--1135",
    }    
    ~~~
    
    * **corel5k**
    ~~~
    @incollection{,
          title="Object Recognition as Machine Translation: Learning a Lexicon for a Fixed Image Vocabulary",
          author="Duygulu, P. and Barnard, K. and de Freitas, J.F.G. and Forsyth, D.A.",
          year="2002",
          booktitle="Computer Vision, ECCV 2002",
          volume="2353",
          series="LNCS",
          pages="97-112"
    }
    ~~~

    * **delicious**
    ~~~
    @inproceedings{,
          author = "Tsoumakas, G. and Katakis, I. and Vlahavas, I.",
          title = "Effective and Efficient Multilabel Classification in Domains with Large Number of Labels",
          booktitle = "Proc. ECML/PKDD Workshop on Mining Multidimensional Data, Antwerp, Belgium, MMD08",
          pages = "30--44",
          year = "2008"
    }
    ~~~

    * **emotions**
    ~~~
    @incollection{,
          title = "Multi-Label Classification of Emotions in Music",
          author = "Wieczorkowska, A. and Synak, P. and Ra\'{s}, Z.",
          booktitle = "Intelligent Information Processing and Web Mining",
          year = "2006",
          volume = "35",
          chapter = "30",
          pages = "307--315"
    }    
    ~~~

    * **enron**
    ~~~
    @incollection{,
          author = "Klimt, B. and Yang, Y.",
          title = "The Enron Corpus: A New Dataset for Email Classification Research",
          booktitle = "Proc. ECML04, Pisa, Italy",
          pages = "217--226",
          year = "2004"
    }
    ~~~
    
    * **eurlex** - Training and test subsets of the DC (`eurlexdc_tra` and `eurlexdc_test`), EV (`eurlexev_tra` and `eurlexev_test`) and SM (`eurlexsm_tra` and `eurlexsm_test`) datasets
    ~~~
    @incollection{,
          title="Efficient pairwise multilabel classification for large-scale problems in the legal domain",
          author="Mencia, E. L. and F{\"u}rnkranz, J.",
          booktitle="Machine Learning and Knowledge Discovery in Databases",
          pages="50--65",
          year="2008"
    }    
    ~~~
    
    * **flags**
    ~~~
    @inproceedings{,
          title="A genetic algorithm for optimizing the label ordering in multi-label classifier chains",
          author="Goncalves, E. C. and Plastino, A. and Freitas, A. A.",
          booktitle="Tools with Artificial Intelligence (ICTAI), 2013 IEEE 25th International Conference on",
          pages="469--476",
          year="2013",
    }    
    ~~~
    
    * **genbase**
    ~~~
    @inproceedings{,
          title = "Protein Classification with Multiple Algorithms",
          author = "Diplaris, S. and Tsoumakas, G. and Mitkas, P. and Vlahavas, I.",
          booktitle = "Proc. 10th Panhellenic Conference on Informatics, Volos, Greece, PCI05",
          year = "2005",
          pages = "448--456"
    }    
    ~~~
    
    * **imdb**
    ~~~
    @article{,
          title = "Classifier chains for multi-label classification",
          author = "Read, J. and Pfahringer, B. and Holmes, G. and Frank, E.",
          journal = "Machine Learning",
          year = "2011",
          volume="85",
          issue="3",
          pages = "333--359"
    }    
    ~~~

    * **langlog**
    ~~~
    @phdthesis{,
          title="Scalable multi-label classification",
          author="Read, Jesse",
          year="2010",
          school="University of Waikato"
    }
    ~~~
    
    * **mediamill**
    ~~~
    @inproceedings{,
          title = "The challenge problem for automated detection of 101 semantic concepts in multimedia",
          author = "Snoek, C. G. M. and Worring, M. and van Gemert, J. C. and Geusebroek, J. M. and Smeulders, A. W. M.",
          booktitle = "Proc. 14th ACM International Conference on Multimedia, MULTIMEDIA06,
          year = "2006",
          pages = "421--430"
    }    
    ~~~    
    
    * **medical**
    ~~~
    @inproceedings{,
          title = "Automatic Code Assignment to Medical Text",
          author = "Crammer, K. and Dredze, M. and Ganchev, K. and Talukdar, P. P. and Carroll, S.",
          booktitle = "Proc. Workshop on Biological, Translational, and Clinical Language Processing,  Prague, Czech Republic, BioNLP07",
          year = "2007",
          pages = "129--136"
    }
    ~~~
    
    * **nuswide** - Dataset with original representation (`nuswide_BoW`) and cVLAD+ representation (`nuswide_VLAD`)
    ~~~
    @inproceedings{,
          title="NUS-WIDE: a real-world web image database from National University of Singapore",
          author="Chua, Tat-Seng and Tang, Jinhui and Hong, Richang and Li, Haojie and Luo, Zhiping and Zheng, Yantao",
          booktitle="Proceedings of the ACM international conference on image and video retrieval",
          pages="48",
          year="2009",
    }    
    ~~~
    
    * **ohsumed**
    ~~~
    @inproceedings{,
          title="Text Categorization with Suport Vector Machines: Learning with Many Relevant Features",
          author="Joachims, Thorsten",
          booktitle="Proc. 10th European Conference on Machine Learning",
          pages="137--142",
          year="1998"
    }    
    ~~~
    
    * **rcv1** - Five subsets of the RCV1 dataset with all the features (`rcv1sub1` to `rcv1sub5`) and a subset with only 500 features selected (`reutersk500`)
    ~~~
    @article{,
          title="RCV1: A new benchmark collection for text categorization research",
          author="Lewis, D. D. and Yang, Y. and Rose, T. G. and Li, F.",
          journal="The Journal of Machine Learning Research",
          volume="5",
          pages="361--397",
          year="2004"
    }    
    ~~~
    
    * **scene**
    ~~~
    @article{,
          title = "Learning multi-label scene classification",
          author = "Boutell, M. and Luo, J. and Shen, X. and Brown, C.",
          journal = "Pattern Recognition",
          year = "2004",
          volume = "37",
          number = "9",
          pages = "1757--1771",
    }    
    ~~~
    
    * **slashdot**
    ~~~
    @article{,
          title = "Classifier chains for multi-label classification",
          author = "Read, J. and Pfahringer, B. and Holmes, G. and Frank, E.",
          journal = "Machine Learning",
          year = "2011",
          volume = "85",
          issue = "3",
          pages = "333--359"
    }    
    ~~~
    
    * **stackex** - Set of six datasets (`stackex_chemistry`, `stackex_chess`, `stackex_coffee`, `stackex_cooking`, `stackex_cs` and `stackex_philosophy`) generated from Stack Exchange forums
    ~~~
    @inproceedings{,
          title="QUINTA: A question tagging assistant to improve the answering ratio in electronic forums",
          author="Charte, Francisco and Rivera, Antonio J. and del Jesus, Maria J. and Herrera, Francisco",
          booktitle="EUROCON 2015 - International Conference on Computer as a Tool (EUROCON), IEEE",
          year="2015",
          pages="1-6",
          month="Sept"
    }    
    ~~~

    * **tmc2007** - Full dataset (`tmc2007`) and version with only 500 features selected (`tmc2007_500`)
    ~~~
    @inproceedings{,
          title="Discovering recurring anomalies in text reports regarding complex space systems",
          author="Srivastava, A. N. and Zane-Ulman, B.",
          booktitle="Aerospace Conference",
          pages="3853--3862",
          year="2005",
    }    
    ~~~
    
    * **yahoo** - 11 datasets generated from Yahoo! directory (`yahoo_arts`, `yahoo_business`, `yahoo_computers`, `yahoo_education`, `yahoo_entertainment`, `yahoo_health`, `yahoo_recreation`, `yahoo_reference`, `yahoo_science`, `yahoo_social`, `yahoo_society`)
    ~~~
    @inproceedings{,
          title="Parametric mixture models for multi-labeled text",
          author="Ueda, N. and Saito, K.",
          booktitle="Advances in neural information processing systems",
          pages="721--728",
          year="2002"
    }    
    ~~~
    
    * **yeast**
    ~~~
    @inproceedings{,
          title = "A Kernel Method for Multi-Labelled Classification",
          author = "Elisseeff, A. and Weston, J.",
          booktitle = "Advances in Neural Information Processing Systems",
          year = "2001",
          volume = "14",
          pages = "681--687",
    }    
    ~~~
