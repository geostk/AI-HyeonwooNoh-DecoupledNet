############################################################
# start training segmentation network with Full annotation #
############################################################

cd 002_train_seg_Full_anno

## create simulinks
# image data
ln -s ../../data/VOC2012
# training / validation imageset
ln -s ../../data/imagesets/seg_imgset_Full
# caffe
ln -s ../../caffe
# pre-trained caffe model (classification network with forward-backward propagation)
ln -s ../../model/fp_bp_model
# directory for saving trained caffe model
ln -s ../../model/DecoupledNet_Full_anno

## create directories
mkdir snapshot
mkdir training_log

## start training
./start_train.sh

## make inference model caffemodel
python BN_make_INFERENCE_script.py

## copy trained model
cp ./DecoupledNet_Full_anno_inference.caffemodel ./DecoupledNet_Full_anno/DecoupledNet_Full_anno_inference.caffemodel
