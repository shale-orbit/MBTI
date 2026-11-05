import '../models.dart';

/// 40 道情景题：4 个维度各 10 题，选项交替对应两极。
const List<Question> questionBank = [
  Question(
    dim: 'EI',
    text: '周末结束，你更想怎么恢复精力？',
    options: [
      OptionItem(text: '约朋友出门吃饭聊天', pole: 'E'),
      OptionItem(text: '在家独处看书或追剧', pole: 'I'),
    ],
  ),
  Question(
    dim: 'EI',
    text: '进入一个新班级或新团队，你通常先：',
    options: [
      OptionItem(text: '先观察气氛，等别人来交流', pole: 'I'),
      OptionItem(text: '主动打招呼，先认识几个人', pole: 'E'),
    ],
  ),
  Question(
    dim: 'EI',
    text: '讨论课上老师抛出问题时，你更倾向于：',
    options: [
      OptionItem(text: '边想边说，在交流中理清思路', pole: 'E'),
      OptionItem(text: '想清楚再举手，或课后单独表达', pole: 'I'),
    ],
  ),
  Question(
    dim: 'EI',
    text: '连续社交一整天后，你通常会：',
    options: [
      OptionItem(text: '消耗很大，需要独处充电', pole: 'I'),
      OptionItem(text: '越聊越有精神，还想继续', pole: 'E'),
    ],
  ),
  Question(
    dim: 'EI',
    text: '遇到烦心事时，你更常：',
    options: [
      OptionItem(text: '找朋友倾诉，说出来会轻松', pole: 'E'),
      OptionItem(text: '自己消化，想明白后再谈', pole: 'I'),
    ],
  ),
  Question(
    dim: 'EI',
    text: '小组作业分工时，你更愿意承担：',
    options: [
      OptionItem(text: '整理资料、独立完成自己那部分', pole: 'I'),
      OptionItem(text: '联络组员、推动大家讨论', pole: 'E'),
    ],
  ),
  Question(
    dim: 'EI',
    text: '课间休息时，你通常会：',
    options: [
      OptionItem(text: '和同学聊天、走动一下', pole: 'E'),
      OptionItem(text: '待在座位上做自己的事', pole: 'I'),
    ],
  ),
  Question(
    dim: 'EI',
    text: '需要上台做展示时，你更接近：',
    options: [
      OptionItem(text: '提前准备充分，但上台前会紧张', pole: 'I'),
      OptionItem(text: '比较享受现场互动，越讲越放松', pole: 'E'),
    ],
  ),
  Question(
    dim: 'EI',
    text: '你更理想的学习环境是：',
    options: [
      OptionItem(text: '有人一起讨论，氛围热闹', pole: 'E'),
      OptionItem(text: '安静独立，不被打扰', pole: 'I'),
    ],
  ),
  Question(
    dim: 'EI',
    text: '认识新朋友后，你通常：',
    options: [
      OptionItem(text: '保持少量但深入的联系', pole: 'I'),
      OptionItem(text: '很快融入对方的圈子', pole: 'E'),
    ],
  ),
  Question(
    dim: 'SN',
    text: '学习一个新软件时，你更习惯：',
    options: [
      OptionItem(text: '跟着教程一步步操作，先掌握具体功能', pole: 'S'),
      OptionItem(text: '先看整体框架，猜它可能怎么设计', pole: 'N'),
    ],
  ),
  Question(
    dim: 'SN',
    text: '听别人讲一件事，你更容易注意到：',
    options: [
      OptionItem(text: '背后的含义、可能的发展', pole: 'N'),
      OptionItem(text: '具体的细节、时间和数字', pole: 'S'),
    ],
  ),
  Question(
    dim: 'SN',
    text: '做小组项目时，你更擅长：',
    options: [
      OptionItem(text: '把任务拆成可执行的步骤并落实', pole: 'S'),
      OptionItem(text: '提出新点子和整体方向', pole: 'N'),
    ],
  ),
  Question(
    dim: 'SN',
    text: '你更喜欢阅读哪类内容？',
    options: [
      OptionItem(text: '真实案例、操作指南', pole: 'S'),
      OptionItem(text: '观点推演、未来趋势', pole: 'N'),
    ],
  ),
  Question(
    dim: 'SN',
    text: '面对一张复杂的地图或说明书，你会：',
    options: [
      OptionItem(text: '先想象整体场景和可能性', pole: 'N'),
      OptionItem(text: '按标注逐项确认', pole: 'S'),
    ],
  ),
  Question(
    dim: 'SN',
    text: '老师讲一个抽象概念时，你更容易理解的方式是：',
    options: [
      OptionItem(text: '先听整体比喻和框架', pole: 'N'),
      OptionItem(text: '看具体例子和操作步骤', pole: 'S'),
    ],
  ),
  Question(
    dim: 'SN',
    text: '你更相信哪种判断？',
    options: [
      OptionItem(text: '亲身经历和可验证的事实', pole: 'S'),
      OptionItem(text: '直觉和对趋势的预感', pole: 'N'),
    ],
  ),
  Question(
    dim: 'SN',
    text: '写课程论文时，你更关注：',
    options: [
      OptionItem(text: '观点是否有新意、有洞见', pole: 'N'),
      OptionItem(text: '资料是否详实、论证是否扎实', pole: 'S'),
    ],
  ),
  Question(
    dim: 'SN',
    text: '别人描述一个陌生地方时，你脑中首先出现：',
    options: [
      OptionItem(text: '具体路线和标志物', pole: 'S'),
      OptionItem(text: '那个地方的整体感觉和画面', pole: 'N'),
    ],
  ),
  Question(
    dim: 'SN',
    text: '你更喜欢的课堂是：',
    options: [
      OptionItem(text: '讨论开放问题、鼓励联想', pole: 'N'),
      OptionItem(text: '讲解清晰、知识点明确', pole: 'S'),
    ],
  ),
  Question(
    dim: 'TF',
    text: '朋友向你抱怨时，你的第一反应是：',
    options: [
      OptionItem(text: '先安慰情绪，让他感觉被理解', pole: 'F'),
      OptionItem(text: '帮他分析问题、给出解决办法', pole: 'T'),
    ],
  ),
  Question(
    dim: 'TF',
    text: '小组出现分歧时，你更看重：',
    options: [
      OptionItem(text: '哪种方案逻辑更合理、效率更高', pole: 'T'),
      OptionItem(text: '大家是否都能接受、关系是否和谐', pole: 'F'),
    ],
  ),
  Question(
    dim: 'TF',
    text: '评价一个作品时，你更先关注：',
    options: [
      OptionItem(text: '表达、氛围、是否打动人', pole: 'F'),
      OptionItem(text: '结构、功能、是否达标', pole: 'T'),
    ],
  ),
  Question(
    dim: 'TF',
    text: '做决定时，你更依赖：',
    options: [
      OptionItem(text: '客观事实和数据', pole: 'T'),
      OptionItem(text: '自己的感受和他人的影响', pole: 'F'),
    ],
  ),
  Question(
    dim: 'TF',
    text: '别人指出你的错误时，你更在意：',
    options: [
      OptionItem(text: '他说得对不对、有没有依据', pole: 'T'),
      OptionItem(text: '他的语气是否尊重、是否顾及你', pole: 'F'),
    ],
  ),
  Question(
    dim: 'TF',
    text: '团队里有人情绪低落、影响进度时，你会先：',
    options: [
      OptionItem(text: '了解具体问题，推动任务回到正轨', pole: 'T'),
      OptionItem(text: '关心他的状态，先安抚再谈任务', pole: 'F'),
    ],
  ),
  Question(
    dim: 'TF',
    text: '你更希望别人怎么评价你？',
    options: [
      OptionItem(text: '温暖、善解人意', pole: 'F'),
      OptionItem(text: '理性、靠谱、有判断力', pole: 'T'),
    ],
  ),
  Question(
    dim: 'TF',
    text: '制定规则时，你更倾向：',
    options: [
      OptionItem(text: '考虑个体差异和特殊情况', pole: 'F'),
      OptionItem(text: '统一标准，按规则执行', pole: 'T'),
    ],
  ),
  Question(
    dim: 'TF',
    text: '看完一部电影后，你更容易记住：',
    options: [
      OptionItem(text: '人物的情感和关系', pole: 'F'),
      OptionItem(text: '情节逻辑和设定是否合理', pole: 'T'),
    ],
  ),
  Question(
    dim: 'TF',
    text: '朋友做了一个你觉得不明智的决定，你会：',
    options: [
      OptionItem(text: '直接指出风险，给出现实建议', pole: 'T'),
      OptionItem(text: '先理解他的选择，再温和表达担心', pole: 'F'),
    ],
  ),
  Question(
    dim: 'JP',
    text: '面对两周后截止的作业，你通常：',
    options: [
      OptionItem(text: '先定计划，按节点推进', pole: 'J'),
      OptionItem(text: '先放着，临近截止再集中完成', pole: 'P'),
    ],
  ),
  Question(
    dim: 'JP',
    text: '出门旅行前，你更倾向：',
    options: [
      OptionItem(text: '大概定个方向，到了再看', pole: 'P'),
      OptionItem(text: '提前订好行程和住宿', pole: 'J'),
    ],
  ),
  Question(
    dim: 'JP',
    text: '你的桌面和文件管理通常是：',
    options: [
      OptionItem(text: '分类清楚，固定位置', pole: 'J'),
      OptionItem(text: '随手放，需要时再找', pole: 'P'),
    ],
  ),
  Question(
    dim: 'JP',
    text: '计划临时被打乱时，你更常：',
    options: [
      OptionItem(text: '觉得没关系，顺势调整', pole: 'P'),
      OptionItem(text: '会不太舒服，想尽快恢复秩序', pole: 'J'),
    ],
  ),
  Question(
    dim: 'JP',
    text: '你更喜欢的工作方式是：',
    options: [
      OptionItem(text: '目标明确、按流程完成', pole: 'J'),
      OptionItem(text: '保留弹性、随时尝试新做法', pole: 'P'),
    ],
  ),
  Question(
    dim: 'JP',
    text: '对于每天的待办事项，你通常：',
    options: [
      OptionItem(text: '心里有数，但不一定写下来', pole: 'P'),
      OptionItem(text: '列清单并逐项勾掉', pole: 'J'),
    ],
  ),
  Question(
    dim: 'JP',
    text: '临时多出一个空闲下午，你会：',
    options: [
      OptionItem(text: '安排一件具体的事，让时间不浪费', pole: 'J'),
      OptionItem(text: '看当时心情，随性决定', pole: 'P'),
    ],
  ),
  Question(
    dim: 'JP',
    text: '你更接受哪种工作节奏？',
    options: [
      OptionItem(text: '留有缓冲，随时调整', pole: 'P'),
      OptionItem(text: '提前排好，按部就班', pole: 'J'),
    ],
  ),
  Question(
    dim: 'JP',
    text: '出门前，你通常会：',
    options: [
      OptionItem(text: '提前确认物品和路线', pole: 'J'),
      OptionItem(text: '差不多就出发，缺什么再买', pole: 'P'),
    ],
  ),
  Question(
    dim: 'JP',
    text: '面对一个长期目标，你更常：',
    options: [
      OptionItem(text: '边走边调整方向', pole: 'P'),
      OptionItem(text: '拆成阶段计划并设截止时间', pole: 'J'),
    ],
  ),
];
