class Feedback < ApplicationRecord
  enum kind: { 'アプリについてのご意見・お問い合わせ': 0, '不具合・エラー報告': 1, 'その他': 2 }
end
