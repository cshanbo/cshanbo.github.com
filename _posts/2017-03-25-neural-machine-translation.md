---
layout: post
title: "Neural Machine Translation"
description: ""
category: 
tags: []
---
{% include JB/setup %}


## 必读论文
神经机器翻译（Neural Machine Translation, NMT），是典型的`Encode-decode`或`seq2seq`框架的应用。
有一些非常重要的paper必须读，列举几篇，比如：
1. Cho, Kyunghyun, et al. "On the properties of neural machine translation: Encoder-decoder approaches." arXiv preprint arXiv:1409.1259 (2014).
2. Bahdanau, Dzmitry, Kyunghyun Cho, and Yoshua Bengio. "Neural machine translation by jointly learning to align and translate." arXiv preprint arXiv:1409.0473 (2014).
3. Sutskever, Ilya, Oriol Vinyals, and Quoc V. Le. "Sequence to sequence learning with neural networks." Advances in neural information processing systems. 2014.

## 开源项目
github上有不少NMT的开源项目，这里有一个相关[列表](https://github.com/jonsafari/nmt-list)。 
最早的项目是Cho等人的基于`Theano`的[dl4mt](https://github.com/nyu-dl/dl4mt-tutorial)，后来，有了dl4mt基础上的改进版本，[nematus](https://github.com/rsennrich/nematus)

我在`nematus`项目中，做了一部分小工作，即：添加了`local attention` [4]的支持（详见[该分支](https://github.com/rsennrich/nematus/tree/local-attention)）。

`Local attention`的本意是为了缓解attention的对齐不准的问题。认为当前attention是由整个源端句子计算而来的，而在每次生成目标端词的时候，事实上只需要通过部分源端词来计算attention，使得模型更`集中`。local attention的具体做法可参考论文[4]，简单说来：
1. 在每次生成目标端词时*(也叫timestep), 利用一个Feedforward Neural Network来计算一个中心点`m`
2. 在源端词的中心点前后固定窗口中计算attention
3. 并且，根据词与中心点之间的距离进行衰减，目的有两个：
    1. 让`注意力` 更集中于中心点
    2. 让local attention可微，便于使用SGD等算法进行优化


# 参考论文
[1] Cho, Kyunghyun, et al. "On the properties of neural machine translation: Encoder-decoder approaches." arXiv preprint arXiv:1409.1259 (2014).
[2] Bahdanau, Dzmitry, Kyunghyun Cho, and Yoshua Bengio. "Neural machine translation by jointly learning to align and translate." arXiv preprint arXiv:1409.0473 (2014).
[3] Sutskever, Ilya, Oriol Vinyals, and Quoc V. Le. "Sequence to sequence learning with neural networks." Advances in neural information processing systems. 2014.
[4] Luong, Minh-Thang, Hieu Pham, and Christopher D. Manning. "Effective approaches to attention-based neural machine translation." arXiv preprint arXiv:1508.04025 (2015).
