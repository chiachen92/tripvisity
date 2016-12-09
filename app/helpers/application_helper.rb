module ApplicationHelper
  def gravatar_for(user, options = { size: 80})
  gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
  size = options[:size]
  gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  image_tag(gravatar_url, alt: user.username, class: "img-circle")
  end

  def upvote_link(comment)
    vote = comment.votes.find_by(user: current_user)
    method = if vote.nil?
              :post
            elsif vote.is_up?
              :delete
            else
              :patch
            end
    path = if vote.nil?
      trip_comment_votes_path(comment, vote: { is_up: true })
    else
      vote_path(vote, vote: { is_up: true })
    end

    link_to(
      fa_icon("caret-up", class: "fa-4x"), path, method: method,
      class: "vote-link #{vote&.is_up? ? 'vote-up' : ''}"
    )
  end

  def downvote_link(comment)
    vote = comment.votes.find_by(user: current_user)
    method = if vote.nil?
              :post
            elsif vote.is_down?
              :delete
            else
              :patch
            end
    path = if vote.nil?
      trip_comment_votes_path(comment, vote: { is_up: false })
    else
      vote_path(vote, vote: { is_up: false })
    end

    link_to(
      fa_icon("caret-down", class: "fa-4x"), path, method: method,
      class: "vote-link #{vote&.is_down? ? 'vote-down' : ''}"
    )

  end
end
