# Numerical-methods

Task 1 (SVD-based Image Compression):
The function 'task1' converts an input image to a double data type, applies Singular Value Decomposition (SVD), and constructs an approximation matrix ('new_X') using the first 'k' singular values. This process compresses the image by retaining the most significant information.

Task 2 (PCA for Image Approximation):
The 'task2' function approximates an input image using Principal Component Analysis (PCA). It involves normalizing the image, calculating covariance, obtaining eigenvectors and eigenvalues, and reconstructing the image using the first 'pcs' principal components. This reduces the image's dimensionality while preserving essential features.

Task 3 (Eigenvalue Analysis for Image Approximation):
The 'task3' function approximates an input image using eigenvalue analysis. It normalizes the image, calculates the covariance matrix, obtains eigenvectors and eigenvalues, selects the top 'pcs' principal components, and reconstructs the image. This method achieves image approximation through eigenvalue decomposition.

Task 4 (Image Classification using KNN):
The task involves multiple functions for image classification. 'visualise_image' extracts and visualizes a specific image from a training matrix. 'prepare_data' loads and prepares training data. 'magic_with_pca' applies PCA to training data. 'prepare_photo' converts a test image into a pixel array. 'KNN' implements the k-nearest neighbors algorithm for prediction. 'classifyImage' combines these functions to classify a test image using PCA and KNN, allowing for efficient image recognition.
