# encoding: utf-8git
class Api::DashboardsController < Api::ApplicationController
  def show
    hash = {top_readers: [
        {
            id: 1,
        login: "vgv",
        books: 23,
        pages: 13414
    },
        {
            id: 2,
        login: "aeg",
        books: 12,
        pages: 5325
    },
        {
            id: 3,
        login: "jboss",
        books: 9,
        pages: 5864
    }
    ], top_reads: [
        {
            id: 1,
        name: "Мастер пикапа: По любви или по печени?",
        author: "Бабуинов А.С., Безотказная Е.К.",
        pages: 459,
        rating: 9.8
    },
        {
            id: 2,
        name: "Диалоги с аквариумом",
        author: "Димедролов К.П.",
        pages: 230,
        rating: 9.4
    },
        {
            id: 3,
        name: "PHP или стройка объектов народного хозяйства?",
        author: "Кнут Д.Э., Ахо А.В., Ульман Д.Д., Хопкрофт Д.Э.",
        pages: 850,
        rating: 8.5
    }
    ], top_ratings: [
        {
            id: 3,
        name: "PHP или стройка объектов народного хозяйства?",
        author: "Кнут Д.Э., Ахо А.В., Ульман Д.Д., Хопкрофт Д.Э.",
        pages: 850,
        rating: 8.5
    },
        {
            id: 2,
        name: "Диалоги с аквариумом",
        author: "Димедролов К.П.",
        pages: 230,
        rating: 9.4
    },
        {
            id: 1,
        name: "Мастер пикапа: По любви или по печени?",
        author: "Бабуинов А.С., Безотказная Е.К.",
        pages: 459,
        rating: 9.8
    }
    ]}
    respond_with hash.to_json
  end
end
