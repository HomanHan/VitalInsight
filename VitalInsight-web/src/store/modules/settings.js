import variables from '@/assets/styles/vitalinsight-variables.scss'
import defaultSettings from '@/settings'
const { tagsView, fixedHeader, sidebarLogo, showFooter, footerTxt, caseNumber } = defaultSettings

const state = {
  theme: variables.theme,
  showSettings: false,
  tagsView: tagsView,
  fixedHeader: fixedHeader,
  sidebarLogo: sidebarLogo,
  showFooter: showFooter,
  footerTxt: footerTxt,
  caseNumber: caseNumber
}

const mutations = {
  CHANGE_SETTING: (state, { key, value }) => {
    if (state.hasOwnProperty(key)) {
      state[key] = value
    }
  }
}

const actions = {
  changeSetting({ commit }, data) {
    commit('CHANGE_SETTING', data)
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}

