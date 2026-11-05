import '../models.dart';

const Map<String, PersonalityType> personalityTypes = {
  'INTJ': PersonalityType(
    name: '建筑师',
    tagline: '战略型 · 独立思考',
    desc: '擅长独立思考与长期规划，重视逻辑和效率，常能看穿事情的结构，但有时显得冷静疏离。',
  ),
  'INTP': PersonalityType(
    name: '逻辑学家',
    tagline: '分析型 · 好奇探索',
    desc: '好奇心强，喜欢追问原理和可能性，享受分析问题本身，行动落地和情绪表达相对少。',
  ),
  'ENTJ': PersonalityType(
    name: '指挥官',
    tagline: '指挥型 · 目标驱动',
    desc: '目标感强，善于组织资源和推动他人，决策果断，追求效率和结果，但需留意他人的感受。',
  ),
  'ENTP': PersonalityType(
    name: '辩论家',
    tagline: '创新型 · 灵活辩论',
    desc: '点子多、反应快，喜欢挑战常规和讨论新可能，适应变化，但容易对重复执行失去耐心。',
  ),
  'INFJ': PersonalityType(
    name: '提倡者',
    tagline: '理想型 · 洞察人心',
    desc: '敏感而有原则，擅长理解他人动机，重视意义与深度关系，倾向理想主义，但容易内耗。',
  ),
  'INFP': PersonalityType(
    name: '调停者',
    tagline: '理想型 · 价值驱动',
    desc: '内心丰富，重视价值观与真诚表达，富有同理心和想象力，但面对冲突时容易退让。',
  ),
  'ENFJ': PersonalityType(
    name: '主人公',
    tagline: '引导型 · 关系导向',
    desc: '善于感染和带动他人，重视关系与共同目标，乐于支持别人成长，但可能过度承担。',
  ),
  'ENFP': PersonalityType(
    name: '竞选者',
    tagline: '感染型 · 热情探索',
    desc: '热情、开放、富有想象力，喜欢探索新关系和新可能，感染力强，但专注与收尾需加强。',
  ),
  'ISTJ': PersonalityType(
    name: '物流师',
    tagline: '执行型 · 稳定可靠',
    desc: '可靠、守规则、重视事实与秩序，擅长把计划稳定落实，喜欢明确标准，但不太喜欢频繁变动。',
  ),
  'ISFJ': PersonalityType(
    name: '守卫者',
    tagline: '守护型 · 细致体贴',
    desc: '细心、体贴、责任感强，擅长照顾具体需要和维护稳定关系，低调付出，但容易忽略自己。',
  ),
  'ESTJ': PersonalityType(
    name: '总经理',
    tagline: '管理型 · 务实高效',
    desc: '务实、果断、组织力强，重视规则与效率，善于安排事务和推动执行，但表达可能偏直接。',
  ),
  'ESFJ': PersonalityType(
    name: '执政官',
    tagline: '协调型 · 群体关怀',
    desc: '热心、重视群体氛围，善于照顾他人和协调关系，乐于参与集体事务，但容易在意评价。',
  ),
  'ISTP': PersonalityType(
    name: '鉴赏家',
    tagline: '实干型 · 冷静应变',
    desc: '冷静、动手能力强，喜欢在实际操作和问题解决中学习，重视自由与效率，情绪表达较少。',
  ),
  'ISFP': PersonalityType(
    name: '探险家',
    tagline: '体验型 · 温和自由',
    desc: '温和、敏感、重视当下的体验与个人价值，审美和共情力好，喜欢自由空间，不喜欢被强推。',
  ),
  'ESTP': PersonalityType(
    name: '企业家',
    tagline: '行动型 · 冒险即兴',
    desc: '行动力强、反应快，喜欢即时挑战和真实体验，善于抓住机会，冒险精神足，但耐心规划较少。',
  ),
  'ESFP': PersonalityType(
    name: '表演者',
    tagline: '表现型 · 活力当下',
    desc: '外向、热情、享受当下，善于活跃气氛和连接他人，喜欢新鲜感，但长期计划需加强。',
  ),
};

const Map<String, List<String>> dimensionPoles = {
  'EI': ['E', 'I'],
  'SN': ['S', 'N'],
  'TF': ['T', 'F'],
  'JP': ['J', 'P'],
};

const Map<String, String> dimensionLabels = {
  'EI': '能量来源',
  'SN': '信息获取',
  'TF': '决策方式',
  'JP': '生活态度',
};

const Map<String, String> poleLabels = {
  'E': '外向',
  'I': '内向',
  'S': '实感',
  'N': '直觉',
  'T': '思考',
  'F': '情感',
  'J': '判断',
  'P': '感知',
};
