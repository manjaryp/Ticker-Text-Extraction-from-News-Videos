# Text Extraction from News Videos
## Mathematical Morphology and Region Clustering Based Text Information Extraction from Malayalam News Videos
Anoop K, Manjary P Gangan, Lajish V L</br>
Computational Intelligence and Data Analytics (CIDA Lab) </br>
Department of Computer Science </br>
University of Calicut, India </br>
:memo: [Paper](https://rd.springer.com/chapter/10.1007/978-3-319-28658-7_37)</br>


**Abstract**: Innovations in technologies like improved internet data transfer, advanced digital data compression algorithms, enhancements in web technology, etc. enabled the exponential growth in digital multimedia data. Among the massive multimedia data, news videos are of higher priority due to its rich up-to-date information and historical evidences. This data is rapidly growing in an unpredictable fashion which requires an efficient and powerful method to index and retrieve such massive data. Even though manual indexing is the most effective, it is the slowest and most expensive. Hence automatic video indexing is considered as an important research problem to be addressed uniquely. In this work, we propose a Mathematical Morphology and Region Clustering based Text Information Extraction (TIE) from Malayalam news videos for Content Based Video Indexing and Retrieval (CBVIR). Morphological gradient acts as an edge detector, by enhancing the intensity variations for detecting the text regions. Further an agglomerative clustering is performed to select the significant text regions. The precision, recall and F1-measure obtained for the proposed approach are 87.45%, 94.85% and 0.91 respectively.

## Citation
```
@InProceedings{anoop2016mathematical,
  title={Mathematical Morphology and Region Clustering Based Text Information Extraction from Malayalam News Videos},
  author={Anoop, K and Gangan, Manjary P and Lajish, VL},
  booktitle={Advances in Signal Processing and Intelligent Recognition Systems},
  pages={431--442},
  year={2016},
  publisher={Springer International Publishing},
  address={Cham},
  isbn={978-3-319-28658-7},
  doi={10.1007/978-3-319-28658-7_37}
}
```

## Matlab codes
1. Clustering of text regions in each video frame ([clus.m](matlab-codes/clus.m))
2. Comparison of video frames ([frame_comparison.m](matlab-codes/frame_comparison.m))
3. Normalised cross corelation of extracted ticker regions ([ncc.m](matlab-codes/ncc.m))
4. Extraction of individual letters ([letterextract.m](matlab-codes/letterextract.m))


## Related works
[1] Manjary P Gangan, Anoop K, Lajish V L "Indexing and retrieval of malayalam news videos based on word image matching." In 2017 International Conference on Advances in Computing, Communications and Informatics (ICACCI), pp. 1103-1108. IEEE, 2017, DOI: 10.1109/ICACCI.2017.8125989. ([Paper](https://ieeexplore.ieee.org/document/8125989)) </br>
[2] Vivek P, Anoop K, and Lajish V. L. "A Keyword spotting approach for content based indexing and retrieval of malayalam news videos.", National Symposium on Acoustics (NSA) Goa, 2015. ([Paper](https://www.researchgate.net/publication/286442254_A_Keyword_Spotting_Approach_for_Content_Based_Indexing_and_Retrieval_of_Malayalam_News_Videos)) </br>
[3] Anoop K, and V. L. Lajish. "Morphology based text detection and extraction from Malayalam news videos." National Conference on Indian Language Computing (NCILC), CUSAT, Kochi, 2014. ([Paper](https://www.researchgate.net/publication/286442060_Morphology_Based_Text_Detection_and_Extraction_from_Malayalam_News_Videos)) ([Github](https://github.com/anoopkdcs/ROI_KeyFrameExtractionFromNewsVideo)) </br> 
